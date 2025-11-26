{ config, pkgs, lib, ... }:

{
  #####################
  # Define Hosts
  #####################
  networking.hosts = {
    #"127.0.0.1" = ["app.local"];
    "127.0.0.1" = ["bitwarden.local"];
  };
}
