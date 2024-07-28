{
  pkgs,
  ...
}: {

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
      size = 20;
    };
    theme = {
      name = "catppuccin-frappe-lavender-compact";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
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
