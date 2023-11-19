{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;
};

  xdg.configFile."nvim" = {
    source = ./.;
    recursive = true;
  };
}
