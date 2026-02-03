{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    transmission_4-qt
  ];

  services.transmission = {
    enable = true;
    package = pkgs.transmission_4;
  };
}
