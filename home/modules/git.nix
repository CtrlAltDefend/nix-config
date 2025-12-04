{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
       user = {
         email = "billymeier92@proton.me";
         name = "billymeier92";
       };
    };
  };
}
