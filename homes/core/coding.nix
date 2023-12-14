{ config, lib, pkgs, nixpkgs, ... }:

let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  home.sessionVariables = {
    GOPATH = "$HOME/.go";
  };

  home.packages = with pkgs; [
  
  # rustc
  # cargo
  # rust-analyzer
  # rustfmt

  ];
}
