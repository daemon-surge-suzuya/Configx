_: {

  programs.kitty.enable = true;

  programs.kitty.extraConfig = "

    linux_display_server wayland
    wayland_titlebar_color background

    font_family JetBrainsMono Nerd Font

    font_size 14
    background_opacity 0.9

    initial_window_width 95c
    initial_window_height 35c
    window_padding_width 5
    confirm_os_window_close 0

    background #14151e 
    foreground #98b0d3 

    color0 #151720
    color8 #4f5572 

    color1 #dd6777
    color9 #e26c7c

    color2  #90ceaa
    color10 #95d3af

    color3  #ecd3a0
    color11 #f1d8a5

    color4  #86aaec
    color12 #8baff1

    color5  #c296eb
    color13 #c79bf0

    color6  #93cee9
    color14 #98d3ee

    color7  #cbced3
    color15 #d0d3d8

    cursor #cbced3
    cursor_text_color #a5b6cf

    selection_foreground #a5b6cf
    selection_background #1c1e27


    url color #5de4c7

    active_border_color #3d59a1
    inactive_border_color #101014
    bell_border_color #fffac2

    tab_bar_style fade
    tab_fade 1
    active_tab_foreground   #3d59a1
    active_tab_background   #16161e
    active_tab_font_style   bold
    inactive_tab_foreground #787c99
    inactive_tab_background #16161e
    inactive_tab_font_style bold
    tab_bar_background #101014

    macos_titlebar_color #16161e

  ";

}
