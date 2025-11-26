{ config, pkgs, ... }:

{
   home.stateVersion = "25.05";
   nixpkgs.config.allowUnfree = true;
   
   home.packages = with pkgs; [

     # window-manager related
     waybar
     brightnessctl
     playerctl
     networkmanagerapplet
     pavucontrol

     # utils
     direnv
     jq
     vim
     wget
     htop
     vlc
     unzip
     
#     arandr
     wlr-randr

     kitty
     nautilus

     libreoffice-fresh

     klog-time-tracker # time tracker :)

     # browsers
     firefox

     # IDEs
     jetbrains-toolbox
     vscode

     # task management
     taskwarrior3
     taskwarrior-tui
   ];

  # TODO: store brave plugins (vimium, bitwarden) 
}
