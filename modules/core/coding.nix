{ config, lib, pkgs, nixpkgs, ... }:

let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  home.sessionVariables = {
    GOPATH = "$HOME/.go";
  };

  home.packages = with pkgs; [
  # Programming Languages
  rustc

  # Package Manager
  cargo

  # Language Servers
  rust-analyzer

  # Etc
  rustup
  rustfmt

  ];
}
