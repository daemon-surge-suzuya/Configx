{
  pkgs,
  inputs,
  ...
}: 

let 
lib = pkgs.lib;
in
{
  
  # For some reason even after enabling bspwm and xserver through home-manager, I couldn't start a session after the reboot so had to add these two lines 
  # services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.dwm.enable = true;
  programs.hyprland.enable = true;
  # programs.hyprland.xwayland.enable = true;

  # programs.hyprland = {
    # enable = true;
    # xwayland.enable = true;
  # };

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
      discord
      ranger
      cmus
      ueberzug
      brave
      iw
    ];

    sessionVariables = {
      DIRENV_WARN_TIMEOUT = "24h";
      DIRENV_LOG_FORMAT = "";
      # WLR_NO_HARDWARE_CURSOR = "1";
      # NIXOS_OZONE_WL = "1";
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
