{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  ];

  services.yggdrasil = {
    enable = true;

    settings = {
      Peers = [
	"wss://ygg.ch.mvault.ru.net:443",
        "quic://yggpeer.tilde.green:62265",
      ];
    };
  };
}
