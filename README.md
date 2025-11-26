# Flakes NIXOS

## Initial Setup

Update /etc/nixos/configuration.nix like that:

```
#/etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}

```

Copy the code in ~/.flakes

Apply the void hostname configuration by example:

```sh
sudo nixos-rebuild switch --flake ~/.flakes#void
```

Apply the user god configuration by example:
```sh
home-manager switch --flake ~/.flakes#god
```

Done.


## Restore some required files

```
~/.config/sops/age/keys.txt
```

## SSH KEYS
id_ed25519_host <-- used by sops-nix
_github <-- used by github
_gitlab <-- used by gitlab


## Commands

System + HM user automatically
```sh
apply
```

## Structure

```
~/.flakes
├── flake.nix
├── flake.lock
├── hosts
│   ├── void.nix
│   ├── hardware-configuration.nix
│   └── modules
│       ├── networking.nix
│       ├── mouse.nix
│       ├── keyboard.nix
│       └── ... (all NixOS-specific host modules)
├── home
│   ├── god.nix          # main user config
│   ├── modules          # Home Manager modules
│   │   ├── default.nix
│   │   ├── zsh.nix
│   │   ├── git.nix
│   │   ├── bat.nix
│   │   └── ... 
│   └── overlays         # package overrides for pinning/fixing
│       └── bat.nix
└── README.md
```
y

