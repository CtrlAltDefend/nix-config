# Update

In order to update nixos, home-manager, from nix 25.05 to 25.11 I needed a couple of researches.

Here is the method I used that worked pretty well.

## Update process

1) Edit flake.nix replace `25.05` by `25.11`
2) Run `nix flake update` -- This will update flake.lock
3) Rebuild the system and home-manager as usual. (nixos-rebuild switch --flake .#hostname home-manager switch --flake .#username)

## Cleanup old generations

`sudo nix-collect-garbage -d`