{ config, pkgs, ... }:

{
  imports = [
    ./homes
  ];

  home.username = "moon";
  home.homeDirectory = "/home/moon";
  home.stateVersion = "23.11";
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.home-manager.enable = true;
}
