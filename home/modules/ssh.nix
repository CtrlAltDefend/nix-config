{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_github";
        identitiesOnly = true;
        forwardAgent = true; # forwards agent to sudo/root (useful for nixos-rebuild switch if needs ssh keys)
      };

      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_gitlab";
        identitiesOnly = true;
        forwardAgent = true; # forwards agent to sudo/root (useful for nixos-rebuild switch if needs ssh keys)
      };
    };
  };
}
