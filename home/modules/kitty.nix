{ config, pkgs, ... }:

{
 home.packages = with pkgs; [
   kitty
 ];

 xdg.configFile."kitty/kitty.conf" = {
   source = ./assets/.config/kitty/kitty.conf;
   force = true;
 };
     
}
