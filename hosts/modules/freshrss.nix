{ config, pkgs, ... }:

{

  services.freshrss = {
    enable = true;
    baseUrl = "http://localhost";
    defaultUser = "god";
    authType = "none";
  };
}
