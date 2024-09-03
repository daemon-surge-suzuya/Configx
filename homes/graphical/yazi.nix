{ pkgs,
  lib,
  fetchFromGithub,
  ...
}: 

{

  # programs.yazi.package = pkgs.yazi.overrideAttrs (finalAttrs: previousAttrs:{
  #     src = pkgs.fetchFromGitHub {
  #     owner = "sxyazi";
  #     repo = "yazi";
  #     rev = "main";
  #     hash = "sha256-ivQHgsZVbELc27h0LTMaBCe/O4ntAnb7oesQqoH7bWY=";
  #     };
  # });

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };

}
