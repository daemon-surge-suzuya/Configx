_: {

  programs.waybar.style = ''
* {
    border: none;
    border-radius: 0;
    font-family: Cartograph CF Nerd Font, monospace;
    font-weight: bold;
    font-size: 19px;
    min-height: 0;
}

window#waybar {
    background: rgba(21, 18, 27, 0);
    color: #cdd6f4;
}

tooltip {
    background: #1e1e2e;
    border-radius: 10px;
    border-width: 2px;
    border-style: solid;
    border-color: #11111b;
}

#workspaces button {
    padding: 5px;
    color: #313244;
    margin-right: 5px;
}

#workspaces button.active {
    color: #a6adc8;
}

#workspaces button.focused {
    color: #a6adc8;
    background: #eba0ac;
    border-radius: 10px;
}

#workspaces button.urgent {
    color: #11111b;
    background: #a6e3a1;
    border-radius: 10px;
}

#workspaces button:hover {
    background: #11111b;
    color: #cdd6f4;
    border-radius: 10px;
}

#custom-language,
#custom-updates,
#custom-caffeine,
#custom-weather,
#window,
#clock,
#battery,
#pulseaudio,
#network,
#custom-waller,
#idle_inhibitor,
#workspaces,
#tray,
#backlight {
    background: #1e1e2e;
    padding: 0px 10px;
    margin: 4px 0px;
    border: 1px solid #181825;
}

#tray {
    border-radius: 10px;
    margin-right: 10px;
}

#workspaces {
    background: #1e1e2e;
    border-radius: 10px;
    margin-left: 10px;
    padding-right: 0px;
    padding-left: 5px;
}

#custom-caffeine,
#custom-waller,
#window,
#clock,
#idle_inhibitor,
#network,
#pulseaudio,
#battery
#pulseaudio.microphone,
#custom-weather {
    border-right: 1px solid #181825;
}

#custom-caffeine,
#custom-waller,
#window,
#idle_inhibitor,
#clock,
#battery,
#custom-weather {
    border-left: 1px solid #181825;
}

#idle_inhibitor {
    color: #89dceb;
    border-radius: 10px 0px 0px 10px;
    margin-left: 10px;
}

#custom-weather {
    color: #f9e2af;
    border-radius: 0px 10px 10px 0px;
}

#custom-waller {
    color: #f38ba8;
    border-radius: 0px 10px 10px 0px;
}

#window {
    border-radius: 10px;
    margin-left: 5px;
    margin-right: 5px;
}

#clock {
    color: #fab387;
    border-radius: 10px 0px 0px 10px;
    margin-left: 5px;
}

#pulseaudio {
    color: #89b4fa;
}

#pulseaudio.microphone {
    color: #cba6f7;
    border-radius: 0px 10px 10px 0px;
    margin-right: 5px;
}

#battery {
    color: #a6e3a1;
    border-radius: 10px 0px 0px 10px;
}
  '';

}
