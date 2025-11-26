{ config, pkgs, ... }:

{
  services.xserver.enable = true; # TODO: is it really related to SDDM?

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "where_is_my_sddm_theme";

  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
  ];
}
