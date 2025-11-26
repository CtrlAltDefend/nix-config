{ config, pkgs, ... }:

{
  # doc: https://wiki.nixos.org/wiki/Displaylink
  # have to run some commands manually:
  #
  # nix-shell -p displaylink --arg config '{ allowUnfree = true; }'
  #
  # this gives instructions that has to be run manually

  environment.systemPackages = with pkgs; [
    displaylink
  ];

  services.xserver.videoDrivers = [ "displaylink" ];

  systemd.services.dlm.wantedBy = [ "multi-user.target" ];
}
