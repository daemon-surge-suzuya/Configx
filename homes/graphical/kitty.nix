_: {
  programs.kitty = {
    enable = true;
    extraConfig = ''
      # Colors
      background #1c1f2a
      foreground #a5a6b5

      color0 #1c1f2a
      color8 #9395a7

      color1 #939CBA
      color9 #939CBA

      color2 #92A2BD
      color10 #92A2BD

      color3 #9EB1CF
      color11 #9EB1CF

      color4 #BABBF1
      color12 #BABBF1

      color5 #BABBF0
      color13 #BABBF0

      color6 #BABBF1
      color14 #BABBF1

      color7 #d3d5ef
      color15 #d3d5ef

      cursor #cbced3
      cursor_text_color #a5b6cf

      selection_foreground #a5b6cf
      selection_background #1c1e27

      url color #5de4c7

      active_border_color #3d59a1
      inactive_border_color #101014
      bell_border_color #fffac2
      
      font_family JetBrainsMono Nerd Font
      font_size 14
      tab_bar_style fade
      tab_fade 1
      active_tab_foreground #3d59a1
      active_tab_background #16161e
      active_tab_font_style bold
      inactive_tab_foreground #787c99
      inactive_tab_background #16161e
      inactive_tab_font_style bold
      tab_bar_background #101014
       
    '';
  };
}

