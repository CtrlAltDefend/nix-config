{ config, pkgs, ... }:

{
 home.packages = with pkgs; [
   xarchiver # gui
   p7zip
   rarcrack
   unrar
 ];

}
