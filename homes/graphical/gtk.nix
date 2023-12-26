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
      name = "Catppuccin-Mocha-Compact-Flamingo-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "flamingo" ];
        size = "compact";
        tweaks = [ "normal" "rimless" ];
        variant = "mocha";
      };
    };
  };
}
