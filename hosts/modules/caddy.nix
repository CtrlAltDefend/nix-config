{ config, pkgs, lib, ... }:

{
  # Note: hosts have to be defined in hosts.nix

  ############################################
  # Caddy reverse proxy
  ############################################
  services.caddy = {
    enable = true;

    # Auto-HTTPS with self-signed certificates for local domains
    #virtualHosts."app.local" = {
    #  extraConfig = ''
    #      reverse_proxy http://127.0.0.1:8080
    #  '';
    #};

    virtualHosts."bitwarden.local" = {
      extraConfig = ''
          reverse_proxy http://127.0.0.1:8222
      '';
    };

    virtualHosts."ai" = {
      extraConfig = ''
          reverse_proxy http://127.0.0.1:3333
      '';
    };

  };
}
