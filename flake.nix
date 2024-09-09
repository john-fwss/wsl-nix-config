{
  description = "im commander shepard and this is my favorite flake on the citadel";

  inputs = {
    # use unstable for the latest versions
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-wsl.url = "github:nix-community/nixos-wsl";
  };

  outputs = { self, nixpkgs, nixos-wsl }:

  let

    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  
  in

  {
    nixosConfigurations = {
      gengar = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./system-packages.nix
          nixos-wsl.nixosModules.wsl
        ];
      };
    };
  };
}
