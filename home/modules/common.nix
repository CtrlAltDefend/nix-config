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
     process-viewer # like htop but with GUI for humans

     direnv
     jq
     vim
     wget
     htop
     ctop # like htop but for containers
     vlc
     unzip
     unrar
     
#     arandr
     wlr-randr

     nautilus

     libreoffice-fresh

     klog-time-tracker # time tracker :)

     # browsers
     firefox

     # IDEs
     vscode
     pre-commit
     hadolint

     # node
     nodejs_24
     pnpm
     yarn

     # python
     python313Packages.huggingface-hub

     # compilers
     gcc # required for mise
     gnumake # required for mise
     gnupg # required for mise
     python313 # required for mise
     cmake
     # task management
     taskwarrior3
     taskwarrior-tui

     waveterm
     
     # AI
     gpt-cli

     # misc
     discord

     # disk utils
     gnome-disk-utility

#     packer
#     ansible
     
     #screenshots
     grim
     swappy
     slurp
     flameshot
     shotman
   ];

  # TODO: store brave plugins (vimium, bitwarden) 
}
