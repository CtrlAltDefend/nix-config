{ config, pkgs, ... }:

{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # for Vial app
  services.udev.extraRules = ''
    # Vial keyboard access rule
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666"
  '';
}
