{ pkgs,
  lib,
  ...
}: 
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "06e5fe1c7a2a4009c483b28b298700590e7b6784";
    hash = "sha256-jg8+GDsHOSIh8QPYxCvMde1c1D9M78El0PljSerkLQc=";
  };
in
{

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    catppuccin.enable = true;
    
    keymap = {
      manager.prepend_keymap = [
        {
          on = ["M"];
          run = "plugin --sync max-preview";
          desc = "Maximize preview";
        }
      ];
    };

    plugins = {
      
      "full-border" = "${yazi-plugins}/full-border";
      "max-preview" = "${yazi-plugins}/max-preview.yazi";
      "chmod" = "${yazi-plugins}/chmod.yazi";

    }; 
  
  };

}
