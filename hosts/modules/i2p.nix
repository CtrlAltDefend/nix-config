{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xd # i2p torrenting client
#    transmission-gtk
  ];

  services.i2pd = {
    enable = true;
    address = "127.0.0.1";
    proto = {
      http.enable = true;
      socksProxy.enable = true;
      httpProxy.enable = true;
      sam.enable = true;
      i2cp = {
        enable = true; # for i2p torrent
        address = "127.0.0.1";
        port = 7654;
      };
    };
  };
}
