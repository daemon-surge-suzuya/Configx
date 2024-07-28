{ config, lib, pkgs, ... }:

{

  services = {
    xserver.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
    libinput.enable = true;
    xserver.xkb.layout = "us";
    xserver.xkb.variant = "";
  };
}
