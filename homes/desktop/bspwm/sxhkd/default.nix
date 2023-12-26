_: {
  services = {
  sxhkd = {
  enable = true;
  
  keybindings = {

  "super + b" = "brave";
  "super + s" = "spotify";
  "super + d" = "discord";
  "super + x" = "i3lock-fancy";
  "super + shift + u" = "flameshot gui";
  "super + Return" = "kitty";
  "super + Escape" = "pkill -USR1 -x sxhkd";

  "alt + o" = "obs";
  "alt + t" = "thunar";
  "alt + c" = "code";
  "alt + n" = "obsidian";
  "alt + a" = "alacritty -e nvim";
  "alt + shift + p" = "pavucontrol";

  "super + alt + i" = "brightnessctl set 1%+";
  "super + alt + o" = "brightnessctl set 1%-";
  
  "super + shift + ctrl + alt + s" = "shutdown now";
  "super + shift + ctrl + alt + r" = "reboot";

  };

  extraConfig = '' 
  #
  # bspwm hotkeys
  #
  # Quit/Restart bspwm
  super + alt + {q,r}
    bspc {quit,wm -r}

  # Close and kill windows
  super + {_,shift + }w
    bspc node -{c,k}

  # Toggle between tiled and monocle layout
  super + m
    bspc desktop -l next

  # Send the newest marked node to the newest preselected node
  super + y
    bspc node newest.marked.local -n newest.!automatic.local

  # Swap the current node and the biggest window
  super + g
    bspc node -s biggest.window

  # Mouse Wheel Gaps
  super + button{4,5}
    bspc config window_gap $(( $(bspc config window_gap) {-,+} 2 ))

  # Contract a window by moving one of its sides inward
  alt + {h,j,k,l}
    bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

  # Expand a window by moving one of its sides outward
  alt + shift + {h,j,k,l}
    bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

  #
  # Window state/flags
  #
  # Test for window state
  super + shift + {t,s,f,q}
    bspc node -t {"~tiled","~pseudo_tiled","~floating","~fullscreen"}

  # Toggle floating mode
  super + shift + alt + f
    bspc node -t ~floating

  # Set node flags
  super + ctrl + {m,x,y,z}
    bspc node -g {marked,locked,sticky,private}

  #
  # Focus/Swap
  #
  # Focus the node in the given direction
  super + {_,shift + } + {h,j,k,l}
    bspc node -{f,s} {west,south,north,east}

  # Focus the node for the given path jump
  super + {p,b,comma,period}
    bspc node -f @{parent,brother,first,second}

  # Focus the next/previous window in the current desktop
  super + {_,shift + }c
    bspc node -f {next,prev}.local.!hidden.window

  # Focus the next/previous desktop in the current monitor
  super + bracket{left,right}
    bspc desktop -f {prev,next}.local

  # Focus the last node/desktop
  super + {grave,Tab}
    bspc {node,desktop} -f last

  # Focus the older or newer node in the focus history
  super + {o,i}
    bspc wm -h off; \
    bspc node {older,newer} -f; \
    bspc wm -h on

  # Focus or send to the given desktop
  super + {_, shift + }{1-9,0}
    bspc {desktop -f, node -d} '^{1-9,10}'

  #
  # Preselect
  #
  # Preselect the direction
  super + ctrl + {h,j,k,l}
    bspc node -p {west,south,north,east}

  # Preselect the ratio
  super + ctrl + {1-9}
    bspc node -o 0.{1-9}

  # Cancel preselection for the focused node
  super + ctrl + space
    bspc node -p cancel

  # Cancel preselection for the focused desktop
  super + ctrl + shift + space
    bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

  #
  # Move/Resize
  #
  # Expand a window by moving one of its sides outward
  super + alt + {h,j,k,l}
    bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

  # Contract a window by moving one of its sides inward
  super + alt + shift + {h,j,k,l}
    bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

  # Move a floating window
  super + {Left,Down,Up,Right}
    bspc node -v {-20 0,0 20,0 -20,20 0}

  '';};
  };
}
