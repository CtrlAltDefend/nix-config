{
  description = "NixOS + Home Manager flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    nix-secrets = {
      url = "git+ssh://git@github.com/CtrlAltDefend/nix-secrets.git?ref=refs/heads/master&rev=7e8bdfd168b6a70b5da8bd4a0f1164b5421bc492";
      flake = false;
    };

    hyprdynamicmonitors.url = "github:fiffeek/hyprdynamicmonitors";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

  };

  outputs = inputs @ { self, nixpkgs, home-manager, sops-nix, nix-secrets, hyprdynamicmonitors, nixos-hardware, ... }:
    let
      system = "x86_64-linux";
      #pkgs = nixpkgs.packages.${system};
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # -------------------------
      #  NixOS System
      # -------------------------
      nixosConfigurations = {
        void = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
             # WIP: want to have home-manager separated
             # home-manager.nixosModules.home-manager # first import HM module
            ./hosts/void.nix
            sops-nix.nixosModules.sops
            nixos-hardware.nixosModules.lenovo-thinkpad-t14-intel-gen6  # Hardware-specific configuration for Lenovo ThinkPad T14
          ];
          extraArgs = { inherit inputs system; };
        };
      };

      # -------------------------
      #  Home Manager User
      # -------------------------
      homeConfigurations = {
        # God user  
        god = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          modules = [ ./home/god.nix ];
          extraSpecialArgs = { inherit inputs system; };
        };
      };
  };
}
