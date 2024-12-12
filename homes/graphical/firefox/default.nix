{ pkgs, ... }:

{

  programs.firefox = {

    enable = true;

    policies = {

      DefaultDownloadDirectory = "\${home}/Downloads";
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      NoDefaultBookmarks = true;

    };

    profiles.default.extensions = with pkgs.nur.repos.rycee.firefox-addons; [

      ublock-origin
      privacy-badger
      decentraleyes
      duckduckgo-privacy-essentials
      disconnect
      proton-vpn

    ];

    profiles.default = {

      extraConfig = ''
        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
        user_pref("svg.context-properties.content.enabled", true);
        user_pref("layout.css.has-selector.enabled", true);

      '';

    };

  };

}
