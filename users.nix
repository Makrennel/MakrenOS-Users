{ config, lib, pkgs, ... }: let
	usersFile = pkgs.runCommand "get-declared-users" {} "ls -1 ${config.users.source} > $out";
	usersList = lib.lists.filter (e: ! (e == "" || e == [])) (lib.strings.split "\n" (builtins.readFile usersFile));
	skeleton = pkgs.runCommand "user-skeleton" {} ''
		mkdir -p $out/{Desktop,Documents,Downloads,Local,Music,Images,Repositories,Shared,Templates,Videos} &&
		mkdir -p $out/Local/{bin,cache,etc,share,state,.var} &&
		mkdir -p $out/Local/etc/git &&
		mkdir -p $out/Local/share/{fonts,icons,themes} &&
		ln -s share/fonts $out/Local/.fonts &&
		ln -s share/icons $out/Local/.icons &&
		ln -s share/themes $out/Local/.themes &&
		ln -s .var $out/Local/var &&
		ln -s bin $out/Local/.bin &&
		ln -s cache $out/Local/.cache &&
		ln -s etc $out/Local/.config &&
		ln -s . $out/Local/.local &&
		ln -s .. $out/Local/home &&
		touch $out/Local/etc/git/config &&
		echo 'wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"' > $out/Local/etc/wgetrc
	'';
in {
	options.users.source = lib.mkOption {
		type = lib.types.str;
	};

	config = {
		security.pam.services.login.makeHomeDir = true;
		security.pam.makeHomeDir.skelDirectory = "${skeleton}";

		users.users = lib.lists.foldl (a: b: a // b) {} (
			lib.lists.forEach usersList (user: { "${user}" = {
				home = "/users/${user}";
				createHome = false;
				isNormalUser = true;
				extraGroups = lib.lists.filter (e: ! (e == "" || e == [])) (lib.strings.split "\n" (builtins.readFile "${config.users.source}/${user}/groups"));
				hashedPassword = lib.removeSuffix "\n" (builtins.readFile "${config.users.source}/${user}/password");
			};})
		);
		
		home-manager.sharedModules = [({ config, lib, ... }: {
			home.homeDirectory = lib.mkForce "/users/${config.home.username}/Local";

			imports = [
				(config.users.source + "/" + config.home.username + "/home")
			];

			xdg.configFile."user-dirs.dirs".txt = ''
				# This file is written by xdg-user-dirs-update
				# If you want to change or add directories, just edit the line you're
				# interested in. All local changes will be retained on the next run.
				# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
				# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
				# absolute path. No other format is supported.
				# 
				XDG_DESKTOP_DIR="/users/${config.home.username}/Desktop"
				XDG_DOWNLOAD_DIR="/users/${config.home.username}/Downloads"
				XDG_TEMPLATES_DIR="/users/${config.home.username}/Templates"
				XDG_PUBLICSHARE_DIR="/users/${config.home.username}/Shared"
				XDG_DOCUMENTS_DIR="/users/${config.home.username}/Documents"
				XDG_MUSIC_DIR="/users/${config.home.username}/Music"
				XDG_PICTURES_DIR="/users/${config.home.username}/Images"
				XDG_VIDEOS_DIR="/users/${config.home.username}/Videos"
			'';
		})];
	};
}

