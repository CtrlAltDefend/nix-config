{ config, pkgs, inputs, system, ... }:

{
  # Import the Home Manager module from the HyprDynamicMonitors flake
  home.packages = [
    inputs.hyprdynamicmonitors.packages.${system}.default
  ];

  # Configure HyprDynamicMonitors
  # assets/.config/hypr/monitor.conf

#  programs.hyprdynamicmonitors = {
#    enable = true;
#  };
}
