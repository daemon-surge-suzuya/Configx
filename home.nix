{ config, pkgs, ... }:

{
  imports = [
  ./modules
  ]; 
  
  home.username = "moon";
  home.homeDirectory = "/home/moon";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
