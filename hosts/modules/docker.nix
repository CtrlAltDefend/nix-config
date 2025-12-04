{ config, pkgs, lib, ... }:

{
  ######################
  # Enable Docker
  ######################
  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";
  ############################################
  # Example Docker container (your service)
  ############################################
  #virtualisation.oci-containers.containers.myapp = {
  #  image = "nginxdemos/hello";
  #  ports = [ "127.0.0.1:8080:80" ];
  #};

  # Note: For reverse proxy management -> caddy.nix / hosts.nix  



}
