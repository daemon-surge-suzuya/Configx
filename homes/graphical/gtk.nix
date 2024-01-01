{
  pkgs,
  ...
}: {

home.packages = with pkgs; [
  dconf
];

  gtk = {
    enable = true;
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
}
