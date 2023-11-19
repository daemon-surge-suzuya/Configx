{
  services.polybar = let
    colors = rec {
      background = "282A2E";
      background-alt = "373B41";
      foreground = "C5C8C6";
      primary = "F0C674";
      secondary = "8ABEB7";
      alert = "A54242";
      disabled = "707880";
      latte-rosewater = "de9584";
      frappe-rosewater = "f2d5cf";
      macchiato-rosewater = "f4dbd6";
      mocha-rosewater = "f5e0dc";
      latte-flamingo = "dd7878";
      frappe-flamingo = "eebebe";
      macchiato-flamingo = "f0c6c6";
      mocha-flamingo = "f2cdcd";
      latte-pink = "ec83d0";
      frappe-pink = "f4b8e4";
      macchiato-pink = "f5bde6";
      mocha-pink = "f5c2e7";
      latte-mauve = "8839ef";
      frappe-mauve = "ca9ee6";
      macchiato-mauve = "c6a0f6";
      mocha-mauve = "cba6f7";
      latte-red = "d20f39";
      frappe-red = "e78284";
      macchiato-red = "ed8796";
      mocha-red = "f38ba8";
      latte-maroon = "e64553";
      frappe-maroon = "ea999c";
      macchiato-maroon = "ee99a0";
      mocha-maroon = "eba0ac";
      latte-peach = "fe640b";
      frappe-peach = "ef9f76";
      macchiato-peach = "f5a97f";
      mocha-peach = "fab387";
      latte-yellow = "e49320";
      frappe-yellow = "e5c890";
      macchiato-yellow = "eed49f";
      mocha-yellow = "f9e2af";
      latte-green = "40a02b";
      frappe-green = "a6d189";
      macchiato-green = "a6da95";
      mocha-green = "a6e3a1";
      latte-teal = "179299";
      frappe-teal = "81c8be";
      macchiato-teal = "8bd5ca";
      mocha-teal = "94e2d5";
      latte-sky = "04a5e5";
      frappe-sky = "99d1db";
      macchiato-sky = "91d7e3";
      mocha-sky = "89dceb";
      latte-sapphire = "209fb5";
      frappe-sapphire = "85c1dc";
      macchiato-sapphire = "7dc4e4";
      mocha-sapphire = "74c7ec";
      latte-blue = "2a6ef5";
      frappe-blue = "8caaee";
      macchiato-blue = "8aadf4";
      mocha-blue = "87b0f9";
      latte-lavender = "7287fd";
      frappe-lavender = "babbf1";
      macchiato-lavender = "b7bdf8";
      mocha-lavender = "b4befe";
      latte-text = "4c4f69";
      frappe-text = "c6ceef";
      macchiato-text = "c5cff5";
      mocha-text = "c6d0f5";
      latte-subtext1 = "5c5f77";
      frappe-subtext1 = "b5bddc";
      macchiato-subtext1 = "b3bce0";
      mocha-subtext1 = "b3bcdf";
      latte-subtext0 = "6c6f85";
      frappe-subtext0 = "a5acc9";
      macchiato-subtext0 = "a1aacb";
      mocha-subtext0 = "a1a8c9";
      latte-overlay2 = "7c7f93";
      frappe-overlay2 = "949bb7";
      macchiato-overlay2 = "8f97b7";
      mocha-overlay2 = "8e95b3";
      latte-overlay1 = "8c8fa1";
      frappe-overlay1 = "838aa4";
      macchiato-overlay1 = "7d84a2";
      mocha-overlay1 = "7b819d";
      latte-overlay0 = "9ca0b0";
      frappe-overlay0 = "737891";
      macchiato-overlay0 = "6c728d";
      mocha-overlay0 = "696d86";
      latte-surface2 = "acb0be";
      frappe-surface2 = "62677e";
      macchiato-surface2 = "5a5f78";
      mocha-surface2 = "565970";
      latte-surface1 = "bcc0cc";
      frappe-surface1 = "51566c";
      macchiato-surface1 = "484c64";
      mocha-surface1 = "43465a";
      latte-surface0 = "ccd0da";
      frappe-surface0 = "414559";
      macchiato-surface0 = "363a4f";
      mocha-surface0 = "313244";
      latte-base = "eff1f5";
      frappe-base = "303446";
      macchiato-base = "24273a";
      mocha-base = "1e1e2e";
      latte-mantle = "e6e9ef";
      frappe-mantle = "292c3c";
      macchiato-mantle = "1e2030";
      mocha-mantle = "181825";
      latte-crust = "dce0e8";
      frappe-crust = "232634";
      macchiato-crust = "181926";
      mocha-crust = "1b1b1b";
    };

  in {
    enable = true;
    script = "pkill polybar && polybar";
    config = {
      "colors" = colors;

      "bar/example" = {
        width = "100%";
        height = "24pt";
        radius = "0";
        background = "${colors.mocha-crust}";
        foreground = "${colors.mocha-text}";
        line-size = "3pt";
        border-size = "4pt";
        border-color = "${colors.mocha-base}";
        padding-left = 1;
        padding-right = 1;
        module-margin = 1;
        separator-foreground = "${colors.mocha-subtext1}";
        font-0 = "SymbolsNerdFontMono-Regular:pixelsize=19";
        font-1 = "Hack:size=12";
        modules-left = "menu bspwm";
        modules-center = "xwindow";
        modules-right = "xkeyboard memory cpu volume pulseaudio date";
        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
        enable-ipc = true;
      };

      "module/menu" = {
        type = "custom/text";
        content = " ";
        content-foreground = "${colors.mocha-pink}";
        content-padding = 2;
        click-left = "brave 'https://search.nixos.org/packages'";
      };

      "module/bspwm" = {
        type = "internal/bspwm";
        format = "<label-state> <label-mode>";
        label = "%index%";
        label-padding = 1;
        label-margin = 1;
        label-font = 1;
        label-focused = "%index%";
        label-focused-padding = 1;
        label-focused-margin = 1;
        label-focused-font = 1;
        label-focused-foreground = "${colors.mocha-text}";
        label-focused-background = "${colors.mocha-surface1}";
        label-focused-underline = "${colors.mocha-mauve}";
        label-occupied = "%index%";
        label-occupied-margin = 1;
        label-occupied-padding = 1;
        label-occupied-background = "${colors.mocha-base}";
        label-occupied-foreground = "${colors.mocha-text}";
        label-occupied-font = 1;
        label-urgent = "%index%";
        label-urgent-background = "${colors.mocha-red}";
        label-empty = "%index%";
        label-empty-padding = 1;
        label-empty-margin = 1;
        label-empty-font = 1;
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        font = 1;
        label = "%title:0:60:...%";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        label-volume-foreground = "${colors.mocha-green}";
        format-volume = "<label-volume>";
        label-volume = "%{T3}%{T-} %percentage%%";
        label-muted = "%{T3}婢%{T-}";
        label-muted-foreground = "${colors.mocha-yellow}";
      };

      "module/xkeyboard" = {
        type = "internal/xkeyboard";
        blacklist-0 = "num lock";
        label-layout = "%{T1}%{T-} %layout%";
        label-layout-foreground = "${colors.mocha-blue}";
        label-indicator-padding = 2;
        label-indicator-margin = 1;
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        label-foreground = "${colors.mocha-peach}";
        label = "%percentage_used%%";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format-prefix-foreground = "${colors.mocha-text}";
        label-foreground = "${colors.mocha-red}";
        label = "%{T3}%{T-}  %percentage%%";
      };

      "network-base" = {
        type = "internal/network";
        interval = 5;
        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";
        label-disconnected = "%{F#F0C674}%ifname%%{F#707880} disconnected}";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%H:%M";
        date-alt = "%Y-%m-%d %H:%M:%S";
        label = "%date%";
        label-foreground = "${colors.mocha-sky}";
      };

      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };
    };
  };
}

