{ config, lib, pkgs, ... }:

{

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.libinput.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "";
  
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.dwm.enable = true;

}
