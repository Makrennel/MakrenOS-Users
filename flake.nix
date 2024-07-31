{
	description = "Configuration flake enforcing user and home creation, as well as env vars to enforce xdg dirs.";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, ... }: {
		nixosModules.default = {
			imports = [
				./users.nix { inherit inputs; }
				./env.nix
			];
		};
	};
}

