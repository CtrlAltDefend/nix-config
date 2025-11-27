{ pkgs, system, inputs, ... }:

{
  # Basic user info
  home.username = "god";
  home.homeDirectory = "/home/god";

  # TODO: was to fix intellij (remove if not needed)
  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    OZONE_PLATFORM = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  # Enable Home Manager features
  programs.home-manager.enable = true;
  
  imports = [
    ./modules/default.nix
  ];
}
