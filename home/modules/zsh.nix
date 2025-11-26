{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    lsd # https://github.com/lsd-rs/lsd
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    autocd = true; # when I type folder name without "cd" it autofix

    history.size = 10000;
    history.expireDuplicatesFirst = true;    

    
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
      ];
    };


    # Extra shell functions go here
    initContent = ''
      # --- Custom function ---
     apply() {
        #sudo nixos-rebuild switch --flake ~/.flakes#void && \
        echo "Rebuilding nixOS system..." && \
        sudo SSH_AUTH_SOCK=$SSH_AUTH_SOCK nixos-rebuild switch --flake ~/.flakes#void && \
        echo "Rebuilding nixOS home..." && \
        sudo SSH_AUTH_SOCK=$SSH_AUTH_SOCK home-manager switch --flake ~/.flakes#god && \
        echo "Reloading Hyprland..." && \
        hyprctl reload
     }


     screenedit() {
       hyprdynamicmonitors tui --config /home/god/.flakes/home/modules/assets/.config/hyprdynamicmonitors/config.toml
     }

      # --- Load Powerlevel10k config if it exists ---
      [[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh

    '';
  };
 
#  programs.starship.enable = true; # FAST and pretty

   home.file.".p10k.zsh" = {
     source = ./assets/.p10k.zsh;
     force = true;
   };

}

