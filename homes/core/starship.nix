{lib, ...}: {
  programs.starship = {
    enable = true;
    enableIonIntegration = false;
    enableFishIntegration = true;
    enableZshIntegration = true;

    # Pure Presets
    settings = {
        palettes.catppuccin_macchiato = {
        rosewater = "#f4dbd6";
        flamingo = "#f0c6c6";
        pink = "#f5bde6";
        mauve = "#c6a0f6";
        red = "#ed8796";
        maroon = "#ee99a0";
        peach = "#f5a97f";
        yellow = "#eed49f";
        green = "#a6da95";
        teal = "#8bd5ca";
        sky = "#91d7e3";
        sapphire = "#7dc4e4";
        blue = "#8aadf4";
        lavender = "#b7bdf8";
        text = "#cad3f5";
        subtext1 = "#b8c0e0";
        subtext0 = "#a5adcb";
        overlay2 = "#939ab7";
        overlay1 = "#8087a2";
        overlay0 = "#6e738d";
        surface2 = "#5b6078";
        surface1 = "#494d64";
        surface0 = "#363a4f";
        base = "#24273a";
        mantle = "#1e2030";
        crust = "#181926";
        };
      palette = "catppuccin_macchiato";
      add_newline = false;
      right_format = lib.concatStrings [
        "$sudo"
        "$nix_shell"
        "\${custom.direnv}"
        "$cmd_duration"
      ];
      continuation_prompt = "▶ ";
      command_timeout = 1000;
      character = {
      success_symbol = "[[♥](mauve) ❯](maroon)";
      error_symbol = "[❯](red)";
      vimcmd_symbol = "[❮](green)";
      };
      git_branch = {
      symbol = " ";
      format = "via [$symbol$branch]($style)";
      style = "bold mauve";
      };
      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\)";
        cherry_pick = "[🍒 PICKING](bold red)";
      };
      nix_shell = {
        format = "[󱄅 ](cyan)";
        heuristic = true;
      };
      sudo = {
        format = "[ ](red)";
        disabled = false;
      };
      cmd_duration = {
      format = "[$duration](fg:peach)";
      style = "yellow";
      min_time = 5000;
      };
    };
  };
}
