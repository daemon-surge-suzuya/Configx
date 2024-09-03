{ pkgs, lib, ... }:

let
  _ = lib.getExe;
in

{
  programs.nushell = {
    enable = true;
    shellAliases = {
      l = "${_ pkgs.eza} --icons";
      ll = "${_ pkgs.eza} -l --icons";
      lt = "${_ pkgs.eza} -T --icons";
      nb = "nix-build -E \'with import <nixpkgs> { }; callPackage ./default.nix { }\'";
      mkdir = "mkdir -p";
      lg = "nix profile history --profile /nix/var/nix/profiles/system --extra-experimental-features nix-command";
    };
    extraConfig = ''
      $env.config = { 
        show_banner: false,
      }
      set -g async_prompt_functions _pure_prompt_git
      starship init fish | source
      ${_ pkgs.direnv} hook fish | source
    '';
    # configFile.source = ~/.config/nushell/config.nu;
  };
  programs.thefuck.enableNushellIntegration = true;
  programs.starship.enableNushellIntegration = true;
  programs.direnv.enableNushellIntegration = true;
}
