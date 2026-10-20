{ config, pkgs, ... }:

{
programs.ssh = {
  enable = true;
  enableDefaultConfig = false;

  settings = {
    "*" = {
      AddKeysToAgent = "yes";
      HashKnownHosts = true;
      ServerAliveInterval = 60;
      ServerAliveCountMax = 3;
    };

    "github.com" = {
      HostName = "github.com";
      User = "git";
      IdentityFile = "~/.ssh/id_ed25519_github";
      IdentitiesOnly = true;
      ForwardAgent = true;
    };

    "github-bwaynos" = {
      HostName = "github.com";
      User = "git";
      IdentityFile = "~/.ssh/id_ed25519_github_bwaynos";
      IdentitiesOnly = true;
      ForwardAgent = true;
    }; 

    "github-turaga" = {
      HostName = "github.com";
      User = "git";
      IdentityFile = "~/.ssh/id_ed25519_github_turaga";
      IdentitiesOnly = true;
      ForwardAgent = true;
    };

    "gitlab.com" = {
      HostName = "gitlab.com";
      User = "git";
      IdentityFile = "~/.ssh/id_ed25519_gitlab";
      IdentitiesOnly = true;
      ForwardAgent = true;
    };

    "rakun-test" = {
      HostName = "rakun-test";
      User = "james";
      IdentityFile = "~/.ssh/id_ed25519_rakun_test";
      IdentitiesOnly = true;
      SetEnv = {
        TERM = "xterm-256color";
      };
    };

    "rakun-prod" = {
      HostName = "rakun-prod";
      User = "jessie";
      IdentityFile = "~/.ssh/id_ed25519_rakun_prod";
      IdentitiesOnly = true;
      SetEnv = {
        TERM = "xterm-256color";
      };
    };
  };
};
}
