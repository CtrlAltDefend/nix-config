{ config, pkgs, lib, inputs, ... }:

let
  secretspath = builtins.toString inputs.nix-secrets;
in
{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules 
    ];

  # SOPS configuration (this is the correct place!)
  sops.defaultSopsFile = "${secretspath}/secrets.yaml";

  sops.age = {
    sshKeyPaths = [ "/home/god/.ssh/id_ed25519_host" ];
    keyFile = "/home/god/.config/sops/age/keys.txt";
  };

  # All secrets in use has to be declared in this list
  sops.secrets = {
    user_god_password = { neededForUsers = true; };
    wifi_nokiac20_password = { };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Automount USB disks
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  security.polkit.enable = true; # allow automounts without sudo

  services.dbus.enable = true;
  xdg.portal.enable = true;
#  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ]; # help intellij webbrowser to work
  # Enable keyring (Keepass)
  #https://www.reddit.com/r/NixOS/comments/1auje1p/hyprland_and_secrets_management/
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.ssdm.enableGnomeKeyring = true;

  # System user
  #users.mutableUsers = false; # Prevent users from changing password or whatever -> config as code! 
 
  users.users.god = {
    isNormalUser = true;
    description = "god";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    hashedPasswordFile = config.sops.secrets.user_god_password.path;
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  #  where-is-my-sddm-theme # installed via sddm.nix
    gvfs # for usb mount

    # Graphic drivers for lenovo intel gpu
    libva
    libva-utils
    mesa # includes VA-API support for Intel GPUs
    intel-media-driver # Intel specific    

    # fix chrome browser in intellij
    libvdpau
    vulkan-loader


    # home-manager (That way it is usable)
    home-manager

    # Misc

    pcsc-tools # test
    ccid # test

    libinput # test
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
