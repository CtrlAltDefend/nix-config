{ pkgs, system, inputs, ... }:

{
  # Basic user info
  home.username = "god";
  home.homeDirectory = "/home/god";

  # Enable Home Manager features
  programs.home-manager.enable = true;
  
  imports = [
    ./modules/default.nix
  ];
}
