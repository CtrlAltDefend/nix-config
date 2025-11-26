{ config, pkgs, ... }:

{
  programs.hyprland.enable = true; # Enable hyprland system module
  programs.hyprland.xwayland.enable = true;
}
