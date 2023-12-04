{
  pkgs,
  inputs,
  ...
}: {
  
  # For some reason even after enabling bspwm and xserver through home-manager, I couldn't start a session after the reboot so had to add these two lines 
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.dwm.enable = true;

  nixpkgs.overlays = [
      (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: { src = /home/moon/1TB/GitHub/Suckless/dwm ;});
      dmenu = prev.dmenu.overrideAttrs (old: { src = /home/moon/1TB/GitHub/Suckless/dmenu ;});
      dwmblocks = prev.dwmblocks.overrideAttrs (old: { src = /home/moon/1TB/GitHub/Suckless/dwmblocks ;});
      })
  ];

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
    "electron-24.8.6"
  ];
  };

  i18n = {
    extraLocaleSettings = {
    LC_MESSAGES = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
    defaultLocale = "en_US.UTF-8";
  
  };

  environment = {
    systemPackages = with pkgs; [

      (picom.overrideAttrs (o: {
      src = pkgs.fetchFromGitHub {
        repo = "picom";
        owner = "pijulius";
        rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
        sha256 = "YiuLScDV9UfgI1MiYRtjgRkJ0VuA1TExATA2nJSJMhM=";
      };
    }))

      # (st.overrideAttrs (oldAttrs: rec {
      # patches = [
      #   /home/moon/1TB/GitHub/Suckless/st/patches/st-blinking_cursor.diff
      #   /home/moon/1TB/GitHub/Suckless/st/patches/st-alpha.diff 
      # ];
      # }))
      #
      (dwm.overrideAttrs (oldAttrs: rec {
      patches = [
        # /home/moon/1TB/GitHub/Suckless/dwm/patches/dwm-alwayscenter.diff
        # /home/moon/1TB/GitHub/Suckless/dwm/patches/dwm-autostart.diff
      ];
      }))

      curl
      dmenu
      pavucontrol
      ripgrep
      picom
      obsidian
      nitrogen
      i3lock-fancy
      sxhkd
      font-awesome
      brightnessctl
      flameshot
      obs-studio
      openh264
      librewolf
      spotify
      ffmpeg
      sxiv
      xwinwrap
      redshift
      discord
      ranger
      cmus
      ueberzug
      brave
      # dwmblocks
      iw
    ];

    sessionVariables = {
      DIRENV_WARN_TIMEOUT = "24h";
      DIRENV_LOG_FORMAT = "";
    };
  };

  nix = {
    settings = {
      sandbox = true;

      experimental-features = [
        "auto-allocate-uids"
        "ca-derivations"
        "flakes"
        "no-url-literals"
        "nix-command"
      ];
    auto-optimise-store = true;
    };
    
    optimise.automatic = true;
  };

}
