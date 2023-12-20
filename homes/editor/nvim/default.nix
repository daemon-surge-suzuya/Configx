{pkgs, ...}: {

home.packages = with pkgs; [

neovide

];

  programs.neovim = {
    enable = true;
    defaultEditor = false;
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;
};

  xdg.configFile."nvim" = {
    source = ./.;
    recursive = true;
  };
}
