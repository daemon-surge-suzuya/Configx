{
  pkgs,
  inputs,
  ...
}: {
  
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
      curl
      pavucontrol
      ripgrep
      picom
      obsidian
      nitrogen
      i3lock-fancy
      # bspwm
      sxhkd
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
