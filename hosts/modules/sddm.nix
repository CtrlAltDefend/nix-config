{ config, pkgs, ... }:

{
  services.xserver.enable = true; # TODO: is it really related to SDDM?

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "sddm-sugar-dark-theme";

  environment.systemPackages = with pkgs; [
    sddm-sugar-dark
#    where-is-my-sddm-theme
  ];
}
