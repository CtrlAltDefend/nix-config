{ config, pkgs, ... }:

{
 home.packages = with pkgs; [
   vial # keyboard GUI manager
 ];

 # note: home/modules/keyboard.nix define a udev rule for vial to work properly
}
