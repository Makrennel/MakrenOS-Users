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

			xdg.cacheHome = "/users/${config.home.username}/Local/cache";
			xdg.configHome = "/users/${config.home.username}/Local/etc";
			xdg.dataHome = "/users/${config.home.username}/Local/share";
			xdg.stateHome = "/users/${config.home.username}/Local/state";

			xdg.userDirs.desktop = "/users/${config.home.username}/Desktop";
			xdg.userDirs.documents = "/users/${config.home.username}/Documents";
			xdg.userDirs.pictures = "/users/${config.home.username}/Images";
			xdg.userDirs.music = "/users/${config.home.username}/Music";
			xdg.userDirs.publicShare = "/users/${config.home.username}/Shared";
			xdg.userDirs.templates = "/users/${config.home.username}/Templates";
			xdg.userDirs.videos = "/users/${config.home.username}/Videos";

			home.preferXdgDirectories = true;
		})];
	};
}

