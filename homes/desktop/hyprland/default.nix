{ pkgs, ... }:

{

imports = [

  ./waybar

];

  home.packages = with pkgs; [

  swww
  wlsunset
  pamixer
  waybar
  waylock
  slurp
  grim
  swappy

  ];


  wayland.windowManager.hyprland = {

    enable = false; 
    # enableNvidiaPatches = true;
    xwayland.enable = true;
  
  };

  home.sessionVariables = {

    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";

  };

}
