# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "gengar";

  wsl.enable = true;
  wsl.defaultUser = "nixos";
  
  system.stateVersion = "24.05"; # no touch
}
