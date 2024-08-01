{ config, lib, ... }: {
	home.homeDirectory = lib.mkForce "/users/${config.home.username}/Local";

	imports = [
		(config.users.source + "/" + config.home.username + "/home")
	];

	xdg.cacheHome = "/users/${config.home.username}/Local/cache";
	xdg.configHome = "/users/${config.home.username}/Local/etc";
	xdg.dataHome = "/users/${config.home.username}/Local/share";
	xdg.stateHome = "/users/${config.home.username}/Local/state";

	xdg.userDirs.enable = true;
	xdg.userDirs.desktop = "/users/${config.home.username}/Desktop";
	xdg.userDirs.documents = "/users/${config.home.username}/Documents";
	xdg.userDirs.pictures = "/users/${config.home.username}/Images";
	xdg.userDirs.music = "/users/${config.home.username}/Music";
	xdg.userDirs.publicShare = "/users/${config.home.username}/Shared";
	xdg.userDirs.templates = "/users/${config.home.username}/Templates";
	xdg.userDirs.videos = "/users/${config.home.username}/Videos";
	xdg.userDirs.extraConfig = {
		XDG_REPOSITORY_DIR = "/users/${config.home.username}/Repositories";
		XDG_FILES_HOME = "/users/${config.home.username}";
		XDG_VAR_HOME = "/users/${config.home.username}/Local/.var";
		XDG_BIN_HOME = "/users/${config.home.username}/Local/bin";
	};

	home.preferXdgDirectories = true;
}

