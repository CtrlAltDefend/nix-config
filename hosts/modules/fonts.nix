{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.ubuntu
    meslo-lgs-nf # used for powerlevel10k theme of zsh
  ];
}
