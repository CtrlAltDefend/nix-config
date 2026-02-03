{ config, pkgs, ... }:

{
 home.packages = with pkgs; [ 
#   i2p
#   i2pd
#   i2pd-tools
   librewolf # need to be configured with i2p proxy for http
 ];
 

}
