{ config, pkgs, lib, ... }:

{
  #############################
  # Ollama
  #############################

  services.ollama = {
    enable = true;
    # Optional: preload models, see https://ollama.com/library
#    loadModels = [ 
 #     "phi3:mini"
      #"qwen2.5:3b"
      #"llama3.2:3b"
  #  ];
  };


}
