{ pkgs, ... }:

{


home.packages = [

pkgs.grimblast
pkgs.wlsunset
pkgs.swaybg

];


  wayland.windowManager.hyprland = {

    # enable = true; 
    enableNvidiaPatches = true;
    xwayland.enable = true;
  
  };

  home.sessionVariables = {

    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";

  };

}
