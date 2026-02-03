{ config, pkgs, ... }:

{
 home.packages = with pkgs; [
   tor
   tor-browser

   mkp224o # vanity address generator for tor onion v3

   simplex-chat-desktop
 ];

}
