{ config, pkgs, lib, ... }:

{
  #############################
  # Vaultwarden (Bitwarden OSS)
  #############################

  services.vaultwarden = {
    enable = true;

    # Vaultwarden’s internal configuration
    config = {
      # Bind only to localhost
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;

      DOMAIN = "http://localhost:8222";
      WEBSOCKET_ENABLED = true;
    };

  };

  # Note: For reverse proxy management -> caddy.nix / hosts.nix  

  #########################################
  # Vaultwarden backup (weekly tar.gz)
  #########################################

  systemd.services.vaultwarden-backup = {
    description = "Backup Vaultwarden data directory";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash ${config.system.build.vaultwardenBackupScript}/bin/vaultwarden-backup";
    };
  };

  systemd.timers.vaultwarden-backup = {
    description = "Weekly Vaultwarden backup";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };

  # The backup script is built using writeShellScriptBin
  system.build.vaultwardenBackupScript = pkgs.writeShellScriptBin "vaultwarden-backup" ''
    set -euo pipefail

    DATA_DIR="/var/lib/vaultwarden"
    BACKUP_DIR="/var/backups/vaultwarden"

    mkdir -p "$BACKUP_DIR"

    TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
    ARCHIVE="$BACKUP_DIR/vaultwarden-backup-$TIMESTAMP.tar.gz"

    echo "Backing up $DATA_DIR to $ARCHIVE"
    tar -czf "$ARCHIVE" -C "$DATA_DIR" .

    # Keep only the last 30 days of backups
    find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +30 -delete
  '';

}
