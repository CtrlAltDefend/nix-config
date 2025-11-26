{ config, pkgs, ... }:

{
  services.upower.enable = true; # required for HyprDynamicMonitor
}
