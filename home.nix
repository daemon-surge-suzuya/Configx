{ config, pkgs, ... }:

{
  imports = [
  ./homes
  ]; 
  
  home.username = "moon";
  home.homeDirectory = "/home/moon";
  home.stateVersion = "23.05";
  home.sessionVariables = {
    EDITOR = "neovide";
  };
  programs.home-manager.enable = true;
}
