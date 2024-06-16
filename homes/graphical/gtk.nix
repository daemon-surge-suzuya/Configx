{
  pkgs,
  ...
}: {

home.packages = with pkgs; [
  dconf
];

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
      size = 20;
    };
    theme = {
      name = "Catppuccin-Frappe-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        tweaks = [ "normal" "rimless" ];
        variant = "frappe";
      };
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata-Original-Classic";
    package = pkgs.bibata-cursors;
    size = 20;
    x11.enable = true;
  };
}
