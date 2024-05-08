{ config, lib, pkgs, ... }:

{

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.libinput.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "";
  
}
