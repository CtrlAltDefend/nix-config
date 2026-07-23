{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    open-webui
  ];
}
