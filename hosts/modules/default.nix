{ config, pkgs, lib, ... }:

{
  imports = [
    ./fonts.nix
    ./locales.nix
    ./hyprland.nix
    ./sddm.nix # login GUI
    ./keyboard.nix
    ./mouse.nix
    ./networking.nix
    ./docker.nix
    ./caddy.nix # reverse proxy
    ./hosts.nix
    ./firewall.nix
    ./vaultwarden.nix
    ./jetbrains.nix
    ./zsh.nix # TODO: why not in home-manager
    ./backup.nix
    ./docking-station.nix
    ./upower.nix
    ./ollama.nix
    ./i2p.nix
    ./transmission.nix
  ];
}
