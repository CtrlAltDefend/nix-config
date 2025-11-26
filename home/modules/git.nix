{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "billymeier92";
    userEmail = "billymeier92@proton.me";
  };
}
