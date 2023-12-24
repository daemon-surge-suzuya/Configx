{
  pkgs,
  inputs,
  ...
}: 

{
  
  # For some reason even after enabling bspwm and xserver through home-manager, I couldn't start a session after the reboot so had to add these two lines 
  # services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.dwm.enable = true;
  programs.hyprland.enable = true;

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
    "electron-25.9.0"
  ];
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

     # (dwm.overrideAttrs (oldAttrs: rec {
     #  patches = [
     #    /home/moon/1TB/GitHub/Suckless/dwm/patches/dwm-alwayscenter.diff
     #    /home/moon/1TB/GitHub/Suckless/dwm/patches/dwm-autostart.diff
     #  ];
     #  }))

     # Imports
     (pkgs.callPackage /home/moon/.config/Bin/NixOs/finder.nix {})
     (pkgs.callPackage /home/moon/.config/Bin/NixOs/unpack.nix {})
     (pkgs.callPackage /home/moon/.config/Bin/NixOs/pack.nix {})
     (pkgs.callPackage /home/moon/.config/Bin/NixOs/dwmbar.nix {})
     (pkgs.callPackage /home/moon/.config/Bin/NixOs/video2wav.nix {})
     (pkgs.callPackage /home/moon/.config/Bin/NixOs/c.nix {})
     (pkgs.callPackage /home/moon/.config/Bin/NixOs/ch-mac.nix {})
     (pkgs.callPackage /home/moon/.config/Bin/NixOs/waller.nix {})

      curl
      dmenu
      pavucontrol
      picom
      obsidian
      nitrogen
      i3lock-fancy
      sxhkd
      brightnessctl
      flameshot
      file
      obs-studio
      librewolf
      spotify
      ffmpeg
      sxiv
      xwinwrap
      redshift
      cmus
      ueberzug
      brave
      iw
      discord
      protonvpn-cli
    ];

    sessionVariables = {
      DIRENV_WARN_TIMEOUT = "24h";
      DIRENV_LOG_FORMAT = "";
    };
  };

  security.pam.services.waylock = {
    text = ''
      auth include login
    '';
  };

  fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        font-awesome
        source-han-sans
        (nerdfonts.override { fonts = [ "Meslo" ]; })
      ];
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

  # Etc
  programs.adb.enable = true;
  programs.fish.enable = true;
  services.flatpak.enable = true;
  services.printing.enable = true;
  security.rtkit.enable = true;

  # steam

  programs.steam = {
    enable = false;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true; 
  };

}
