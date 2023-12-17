{ pkgs, lib, ... }: 

let
_ = lib.getExe;
in

with pkgs; { 

  programs.helix = {

    enable = true;

    extraPackages = [
    
    rustup
    rust-analyzer
    clippy
    
    ];

    settings = {
    
      theme = "base16_transparent";
    
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
