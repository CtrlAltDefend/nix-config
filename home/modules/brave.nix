{ config, pkgs, ... }:

{
  programs.brave = {
    enable = true;
    commandLineArgs = [ 
      "--ozone-platform=x11" # Fix issue of brave crashing on extern monitor (worked fine on the eDP-1 internal monitor of Lenovo however)
    ];
  };
}
