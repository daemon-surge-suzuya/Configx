{ pkgs, lib, ... }: 

let
_ = lib.getExe;
in

with pkgs; { 

  programs.helix = {

    enable = true;

    languages = {

      language-server.rust-analyzer = {

        command = "${_ rust-analyzer}";
      
      };

      language = [{

        name = "rust";
        auto-format = true;

      }];

    };

  };

}
