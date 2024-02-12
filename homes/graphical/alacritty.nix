_: {
  programs.alacritty = {
  enable = true;
  
  settings = {
  
  window = {
  opacity = 1.0;
  };
  
  shell = {
  program = "fish";
  };
  
  cursor = {
    style = "Beam";
  };

colors = {
  primary = {
    background = "#1c1f2a";
    foreground = "#a5a6b5";
    };
  normal = {
    black = "#1c1f2a";
    red = "#939CBA";
    green = "#92A2BD";
    yellow = "#9EB1CF";
    blue = "#BABBF1";
    magenta = "#BABBF0";
    cyan = "#BABBF1";
    white = "#d3d5ef";
    };
  bright = {
    black = "#9395a7";
    red = "#939CBA";
    green = "#92A2BD";
    yellow = "#9EB1CF";
    blue = "#BABBF1";
    magenta = "#BABBF0";
    cyan = "#BABBF1";
    white = "#d3d5ef";
    };
  };
 };
};
}
