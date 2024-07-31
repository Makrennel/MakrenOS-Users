{ lib, ... }: let
	usersFile = pkgs.runCommand "get-declared-users" {} "ls -1 ${users.source} > $out";
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

	security.pam.makeHomeDir = true;
	security.pam.makeHomeDir.skelDirectory = skeleton;

	users.users = foldl (a: b: a // b) {} {
		lib.lists.forEach usersList (user: lib.nameValuePair user {
			home = "/users/${user}";
			createHome = false;
			isNormalUser = true;
			extraGroups = lib.lists.filter (e: ! (e == "")) (lib.strings.split "\n" (builtins.readFile "${users.source}/${user}/groups"));
			hashedPassword = lib.removeSuffix "\n" (builtins.readFile "${users.source}/${user}/password");
		});
	};

	home-manager.users = foldl (a: b: a // b) {} {
		lib.lists.forEach usersList (user: lib.nameValuePair user {
			home.username = user;
			home.homeDirectory = lib.mkForce "/users/${user}/Local"; # Home Manager should only manage settings

			imports = [
				${users.source}/${user}/home
			];
		});
	};
}

