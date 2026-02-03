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

  home.file.".local/share/applications/hyprdynamicmonitors-tui.desktop".text = ''
    [Desktop Entry]
    Name=Display Settings
    Comment=Monitor layout configuration (HyprDynamicMonitors)
    Exec=kitty --class=DisplaySettings -e hyprdynamicmonitors tui
    Terminal=false
    Type=Application
    Categories=Settings;HardwareSettings;
    Icon=preferences-desktop-display
  '';

}
