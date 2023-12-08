# Extra Services
{ config, lib, pkgs, ... }:

{

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  services.flatpak.enable = true;
  services.printing.enable = false;
  
  # Extras
  security.rtkit.enable = true;

}

