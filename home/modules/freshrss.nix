{ config, pkgs, ... }:

{
   home.stateVersion = "25.05";
   nixpkgs.config.allowUnfree = true;
   
   home.packages = with pkgs; [
     freshrss
   ];

  # TODO: store brave plugins (vimium, bitwarden) 
}
