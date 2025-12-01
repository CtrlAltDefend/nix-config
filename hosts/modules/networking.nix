{ config, pkgs, lib, ... }:

let
  wifiPass = config.sops.secrets.wifi_nokiac20_password.path;
in
{
  # Enable networking
  networking.networkmanager.enable = true;

  networking.hostName = "void"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

#  networking.wireless.enable = true;
  networking.networkmanager.ensureProfiles.profiles = {
    "Nokia C20" = {
      connection = {
        id = "Nokia C20";
        type = "wifi";
        autoconnect = true;
      };
      wifi = {
        ssid = "Nokia C20";
        mode = "infrastructure";
      };
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk-file = config.sops.secrets.wifi_nokiac20_password.path;
      };
      ipv4.method = "auto";
      ipv6.method = "auto";
    };
  };
}
