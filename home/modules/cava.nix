{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    cava
  ];

   xdg.configFile."cava/config" = {
     source = ./assets/.config/cava/config;
     force = true;
   };
}
