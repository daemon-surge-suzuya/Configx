_: {

  programs.waybar.enable = true;

  programs.waybar.settings = [{
    layer = "top";
    position = "top";
    mod = "dock";
    exclusive = true;
    passthrough = false;
    gtk-layer-shell = true;
    height = 0;
    modules-left = [
        "clock"
        "custom/weather"
        "idle_inhibitor"
        "custom/waller"
    ];
    modules-center = ["hyprland/window"];
    modules-right = [
        "battery"
        "backlight"
        "pulseaudio"
        "pulseaudio#microphone"
    ];

    "hyprland/window" = {
        format = "{}";
    };
    "wlr/workspaces" = {
        disable-scroll = true;
        all-outputs =  true;
        on-click = "activate";
        format = "{icon}";
        persistent_workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "10" = [];
        };
    };
   "custom/weather" = {
        tooltip = true;
        format = "{}";
        interval = 30;
        exec = "bash ~/wttr.sh";
        return-type = "json";
    };
    "tray" = {
        icon-size = 13;
        spacing = 15;
    };
    "clock" = {
        format = "{: %R   %d/%m}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };
    "backlight" = {
        device = "intel_backlight";
        format = "{icon} {percent}%";
        format-icons = ["" "" ""];
        on-scroll-up = "brightnessctl set 1%+";
        on-scroll-down = "brightnessctl set 1%-";
        min-length = 6;
    };
    "battery" =  {
        states = {
            good =  95;
            warning = 30;
            critical = 20;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-alt = "{time} {icon}";
        format-icons = ["" "" "" "" "" "" "" "" "" "" ""];
    };
    "pulseaudio" = {
        format = "{icon} {volume}%";
        tooltip = false;
        format-muted = " Muted";
        on-click = "pamixer -t";
        on-scroll-up = "pamixer -i 5";
        on-scroll-down = "pamixer -d 5";
        scroll-step = 5;
        format-icons =  {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
        };
    };
    "pulseaudio#microphone" = {
        format = "{format_source}";
        format-source = " {volume}%";
        format-source-muted = " Muted";
        on-click = "pamixer --default-source -t";
        on-scroll-up = "pamixer --default-source -i 5";
        on-scroll-down = "pamixer --default-source -d 5";
        scroll-step = 5;
    };
    
    "custom/waller" = {
          on-click = "waller -p Wayland -r --path ~/Wallpapers";
          on-click-middle = "default_wall";
          on-click-right = "waller -p Wayland -r -a --path ~/Wallpapers/Animated";
          format = " 󰠖 ";
          tooltip = false;
    };

    "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = false;
        };
  
  }];

}
