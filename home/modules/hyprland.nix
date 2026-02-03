{ config, pkgs, ... }:

{
   home.packages = with pkgs; [
     # hyprland window-manager related
     hypridle
     hyprlock     
   ];

   # Copy hyprland config files
   xdg.configFile."hypr/hyprland.conf" = {
     source = ./assets/.config/hypr/hyprland.conf;
     force = true; # override
   };

   xdg.configFile."hypr/monitors.conf" = {
     source = ./assets/.config/hypr/monitors.conf;
     force = true;
   };

   xdg.configFile."hypr/hypridle.conf" = {
     source = ./assets/.config/hypr/hypridle.conf;
     force = true;
   };

   xdg.configFile."hypr/hyprlock.conf" = {
     source = ./assets/.config/hypr/hyprlock.conf;
     force = true;
   };

   xdg.configFile."hypr/lockscreen.jpg" = {
     source = ./assets/.config/hypr/lockscreen.jpg;
     force = true;
   };
}
