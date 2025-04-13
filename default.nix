{ inputs
, lib
, pkgs
, ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{

  imports = [
    inputs.spicetify-nix.nixosModules.default
    ./hardware-configuration.nix
    ./modules/default.nix
  ];

  services.xserver = {

    enable = true;

    windowManager = {

      bspwm.enable = true;
      dwm.enable = false;
      i3.enable = false;

    };
 
    xkb = {
      layout = "us";
      variant = "";
    };

  };

    services.displayManager.sddm.enable = true;

 # programs.hyprland.enable = true;

  # Nix Configuration

  nixpkgs.overlays = [
    (final: prev: {
      # dwm = prev.dwm.overrideAttrs (old: { src = /home/moon/1TB/GitHub/dwm ;});
      # dmenu = prev.dmenu.overrideAttrs (old: { src = /home/moon/1TB/GitHub/Suckless/dmenu ;});
      # dwmblocks = prev.dwmblocks.overrideAttrs (old: { src = /home/moon/1TB/GitHub/Suckless/dwmblocks ;});
      # st = prev.st.overrideAttrs (old: { src = /home/moon/1TB/GitHub/Suckless/st ;});
    })
  ];

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

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  #     inherit pkgs;
  #   };
  # };

  # Unfree

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
    "spotify"
  ];

  environment = {
    systemPackages = with pkgs; [

      (picom.overrideAttrs (o: {
        src = pkgs.fetchFromGitHub {
          repo = "picom";
          owner = "pijulius";
          rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
          sha256 = "YiuLScDV9UfgI1MiYRtjgRkJ0VuA1TExATA2nJSJMhM=";
        };
        buildInputs = o.buildInputs ++ [ pkgs.pcre ];
        nativeBuildInputs = o.nativeBuildInputs ++ [ pkgs.asciidoc ];
        doInstallCheck = false;
      }))

      # (dwm.overrideAttrs (oldAttrs: rec {
      #  patches = [
      #    /home/moon/1TB/GitHub/Suckless/dwm/patches/dwm-alwayscenter.diff
      #    /home/moon/1TB/GitHub/Suckless/dwm/patches/dwm-autostart.diff
      #  ];
      #  }))

      # Imports
      (pkgs.callPackage ./homes/scripts/unpack.nix { })
      (pkgs.callPackage ./homes/scripts/pack.nix { })
      (pkgs.callPackage ./homes/scripts/ch-mac.nix { })
      (pkgs.callPackage ./homes/scripts/a.nix { })
      (pkgs.callPackage ./homes/scripts/finder.nix { })
      (pkgs.callPackage ./homes/scripts/upload.nix { })
      (pkgs.callPackage ./homes/scripts/idleLock.nix { })

      nh
      yazi
      curl
      pavucontrol
      picom
      obsidian
      nitrogen
      i3lock-fancy
      sxhkd
      guvcview
      brightnessctl
      flameshot
      # file
      obs-studio
      librewolf
      ani-cli
      ffmpeg-full
      sxiv
      xwinwrap
      redshift
      brave
      element-desktop
      btop
      libnotify
      xorg.xdpyinfo
      xclip
      vesktop
      tor-browser
      proton-pass
      protonmail-desktop
    ];
  };



  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      font-awesome
      source-han-sans
      (nerdfonts.override { fonts = [ "Meslo" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        emoji = [ "Apple Color Emoji" ];
      };
    };
  };

  # steam

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # spicetify 

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions ; [
      adblock
      hidePodcasts
      shuffle
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };

  # Etc

  services = {
    
    flatpak.enable = true;
    printing = {
      enable = true;
      drivers = with pkgs ; [ hplip ];
    };
    blueman.enable = true;
    automatic-timezoned.enable = false;
    libinput.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    }; 

  };

  hardware = {
    printers = {
      ensurePrinters = [{
        name = "hp-smart_tank_580-590_series";
        location = "Home";
        deviceUri =
          "usb://HP/Smart%20Tank%20580-590%20series?serial=TH44B6W0W7&interface=1";
        model = "drv:///hp/hpcups.drv/hp-smart_tank_580-590_series.ppd";
        ppdOptions = { PageSize = "A4"; };
      }];
    };
    pulseaudio.enable = false;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  programs = {
    
    adb.enable = true;
    fish.enable = true;
    dconf.enable = true;
  
  };

  # sound.enable = true;
  security.rtkit.enable = true;

  # Drives Configuration

  fileSystems."/home/moon/1TB" = {
    device = "/dev/disk/by-uuid/7dc58477-2386-4853-8588-fdc1cfde9f24";
    fsType = "ext4";
  };

  # Time Zone and Internationalization Settings

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LANGUAGE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_ADDRESS = "lg_UG.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Environment Configuration

  environment.variables.DIRENV_LOG_FORMAT = "";

  environment.sessionVariables = {
    DIRENV_WARN_TIMEOUT = "24h";
    DIRENV_LOG_FORMAT = "";
  };

  security.pam.services.waylock = {
    text = ''
      auth include login
    '';
  };

  xdg = {
  
  portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  };

  # Network Configuration

  networking.networkmanager.enable = true;
  # Configure network proxy if necessary.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # State Version

  system.stateVersion = "24.11";

}
