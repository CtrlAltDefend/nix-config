{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
# need home manager > 23.05 TODO: why it doesnt work then???
#    startAgent = true; # automatically starts ssh-agent
    forwardAgent = true; # forwards agent to sudo/root (useful for nixos-rebuild switch if needs ssh keys)

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_github";
        identitiesOnly = true;
      };

      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_gitlab";
        identitiesOnly = true;
      };
    };
  };
}
