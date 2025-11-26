{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
  ];

  # Wofi shutdown menu
  # Note: is displayed when running sh /home/god/.config/wofi/powermenu.sh
  # hint update hyprland.conf with a bind to do that
  home.file.".config/wofi/powermenu.sh".text = ''
    #!/usr/bin/env bash
    options="  Shutdown
      Reboot
      Lock
      Logout"

    choice=$(echo -e "$options" | wofi --gtk-dark --dmenu --prompt "Power Menu")

      case $choice in
        "  Shutdown")
            systemctl poweroff
            ;;
        "  Reboot")
            systemctl reboot
            ;;
        "  Lock")
            hyprlock
            ;;
        "  Logout")
            hyprctl dispatch exit
            ;;
      esac
    '';
  home.file.".config/wofi/powermenu.sh".executable = true;
}
