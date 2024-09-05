{ config, pkgs, ... }:

{
  home.stateVersion = "23.11";
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
