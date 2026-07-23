{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    cmake
    gperf
    zlib
    openssl
    ccache
    pkg-config    
  ];
}
