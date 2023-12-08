_: {
imports = [ 
   ./sxhkd
];

 xsession = {
 enable = true;
 windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    startupPrograms = [
      "pgrep -x sxhkd > /dev/null || sxhkd"
      "polybar"
      "picom --config ~/.config/picom/picom.conf -b --animations --animation-window-mass 0.5 --animation-for-open-window zoom --animation-stiffness 350"
      "bash ~/.config/scripts/redshift.sh"
      "flameshot"
      "nitrogen --restore"
    ];

    monitors = {
    eDP-1 = [
        "I"
        "II"
        "III"
        "IV"
        "V"
        "VI"
        "VII"
        "VIII"
        "IX"
        "X"
    ]; };

    settings = {
    focus_follows_pointer = true;
    border_width = 0;
    window_gap = 15;
    split_ratio = 0.52;
    gapless_monocle = true;
    borderless_monocle = true;
    normal_border_color = "#4D2DB7";
    urgent_border_color = "#4D2DB7";
    presel_border_color = "#4D2DB7";
    focused_border_color = "#4D2DB7";
    };
  
    rules = {
    "Zathura" = {
    state = "tiled";
    };
    
    "Sxiv" = {
    state = "floating";
    center = true;
    };
    
    };
    };
 };
}
