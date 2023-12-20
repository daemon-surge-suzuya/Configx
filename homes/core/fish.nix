{
  pkgs,
  lib,
  config,
  ...
}: let
  _ = lib.getExe;
in
  with pkgs; {

    programs.fish = {
      enable = true;

      interactiveShellInit = ''
        set -g async_prompt_functions _pure_prompt_git
        starship init fish | source
        ${_ direnv} hook fish | source
      '';

      shellAliases = {
        "nvim" = "neovide";
        "nb" = "nix-build -E \'with import <nixpkgs> { }; callPackage ./default.nix { }\'";
        "mkdir" = "mkdir -p";
        "lg" = "nix profile history --profile /nix/var/nix/profiles/system --extra-experimental-features nix-command";
      };

      functions = {
        conv-aud = ''ffmpeg -i $argv[1] -vn -y $argv[2]'';
        fi = ''
                set path (fzf)
                if test "$path" = ""
                  else if [ "$path" != "" ] 
                    if test -d $path
                     $path 
                    else
                    xdg-open $path 
                  end
                end
        '';
      };

      plugins = [
        {
          name = "pure";
          src = pkgs.fetchFromGitHub {
            owner = "pure-fish";
            repo = "pure";
            rev = "f1b2c7049de3f5cb45e29c57a6efef005e3d03ff";
            hash = "sha256-MnlqKRmMNVp6g9tet8sr5Vd8LmJAbZqLIGoDE5rlu8E=";
          };
        }
        {
          name = "fish-async-prompt";
          src = pkgs.fetchFromGitHub {
            owner = "acomagu";
            repo = "fish-async-prompt";
            rev = "4c732cc043b8dd04e64a169ec6bbf3a9b394819f";
            hash = "sha256-YgqZINmY4nKphlqwHo2B0NfP4nmSxIIuAMUuoftI9Lg=";
          };
        }
      ];
    };

    programs.man.generateCaches = true;
  }
