{ config, pkgs, lib, ... }:

let
_ = lib.getExe;
in

{
  
  home = {
    packages = with pkgs; [
      bat
      ripgrep
    ];
  };
  
  programs = {
    fzf.enable = true;
  };

  programs.fish = {
  
  shellAliases = {
    "fd" = "fzf | xargs -r zathura";
    "fv" = "fzf | xargs -r mpv";
    "fn" = "fzf | xargs -r $EDITOR";
    "cat" = "${_ pkgs.bat}";
  };
  
  };


}
