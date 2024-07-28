{ pkgs, lib, ... }:

let
  _ = lib.getExe;
in

with pkgs; {

  programs.helix = {

    enable = true;
    defaultEditor = false;

    settings = {

      theme = "catppuccin_mocha";

    };

    languages = {

      language-server.rust-analyzer = {

        command = "${_ rust-analyzer}";

        config.check = {
          "command" = "${_ clippy}";
        };

      };

      language = [{

        name = "rust";
        auto-format = true;

      }];

    };

  };

}
