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
     ctop # like htop but for containers
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
     mise
     vscode

     # node
     nodejs_24

     # compilers
     gcc # required for mise
     gnumake # required for mise
     gnupg # required for mise
     python313 # required for mise


     # task management
     taskwarrior3
     taskwarrior-tui
   ];

  # TODO: store brave plugins (vimium, bitwarden) 
}
