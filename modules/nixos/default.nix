{
  pkgs,
  inputs,
  ...
}: {
  
  nixpkgs.config = {
    allowUnfree = true;
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
      nitrogen
      i3lock-fancy
      bspwm
      sxhkd
      brightnessctl
      flameshot
      obs-studio
      openh264
      librewolf
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

  nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
  };

  nix = {
    nixPath = ["nixpkgs=flake:nixpkgs"]; # https://ayats.org/blog/channels-to-flakes/

    package = inputs.nix-super.packages.${pkgs.system}.nix;

    settings = {
      # Prevent impurities in builds
      sandbox = true;

      experimental-features = [
        "auto-allocate-uids"
        "ca-derivations"
        # "configurable-impure-env"
        "flakes"
        "no-url-literals"
        "nix-command"
        "parse-toml-timestamps"
        "read-only-local-store"
      ];
      # Give root user and wheel group special Nix privileges.
      trusted-users = ["root" "@wheel"];
      allowed-users = ["@wheel"];


    };

    optimise.automatic = true;
  };

}
