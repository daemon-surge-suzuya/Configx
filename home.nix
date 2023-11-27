{ config, pkgs, ... }:

{
  imports = [
  ./homes
  ./modules/desktop/bspwm
  ]; 
  
  home.username = "moon";
  home.homeDirectory = "/home/moon";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
