{ lib, ... }: let
	usersFile = pkgs.runCommand "get-declared-users" {} "ls -1 ${users.source} > $out";
	usersList = lib.lists.filter (e: ! (e == "" || e == [])) (lib.strings.split "\n" (builtins.readFile usersFile));
in {
	options.users.source = lib.mkOption {
		type = lib.types.str;
	};

	security.pam.makeHomeDir = true;
	security.pam.makeHomeDir.skelDirectory = users.source;

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

