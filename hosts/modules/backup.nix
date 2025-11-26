{ config, pkgs, ... }:

let
  backupScript = pkgs.writeShellScriptBin "nixos-backup" ''
    #!/usr/bin/env bash
    set -euo pipefail

    BACKUP_DIR="/var/backups/nixos"
    mkdir -p "$BACKUP_DIR"

    TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
    rsync -a --delete /home/god/.flakes/ "$BACKUP_DIR/$TIMESTAMP/"

    # Delete backups older than 2 days
    find "$BACKUP_DIR" -maxdepth 1 -mindepth 1 -type d -mtime +2 -exec rm -rf {} \;
  '';
in
{
  # Make script available system-wide
  environment.systemPackages = [
    backupScript
    pkgs.rsync
  ];

  # Systemd service using the script in the Nix store
  systemd.services.nixos-backup = {
    description = "Backup Nix configuration";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${backupScript}/bin/nixos-backup";
    };
  };

  # Hourly timer
  systemd.timers.nixos-backup = {
    description = "Run NixOS backup every hour";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
  };
}
