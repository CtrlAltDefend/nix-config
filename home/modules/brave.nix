{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
  ];

  nixpkgs.overlays = [
    (import ../overlays/brave.nix)
  ];

}
