{ ... }:
{

xdg = {
  mimeApps.defaultApplications = {

  "text/html" = "brave.desktop";
  "x-scheme-handler/http" = "brave.desktop";
  "x-scheme-handler/https" = "brave.desktop";
  "x-scheme-handler/about" = "brave-browser.desktop";
  "x-scheme-handler/unknown" = "brave-browser.desktop";
  "x-scheme-handler/chrome" = "brave.desktop";
  "application/x-extension-htm" = "brave.desktop";
  "application/x-extension-html" = "brave.desktop";
  "application/x-extension-shtml" = "brave.desktop";
  "application/xhtml+xml" = "brave.desktop";
  "application/x-extension-xhtml" = "brave.desktop";
  "application/x-extension-xht" = "brave.desktop";
  "image/jpeg" = "evince.desktop";
  "image/png" = [
    "evince.desktop"
    "sxiv.desktop"
  ];
  "image/gif" = "evince.desktop";
  "image/bmp" = "evince.desktop";
  "image/tiff" = "evince.desktop";
  "application/pdf" = [
    "evince.desktop"
    "zathura.desktop"
  ];

  };
};

}
