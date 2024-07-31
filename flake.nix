{
	description = "Configuration flake enforcing user and home creation, as well as env vars to enforce xdg dirs.";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs@ { self, nixpkgs, ... }: {
		nixosModules.default = import ./module.nix inputs;
	};
}

