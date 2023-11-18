{lib, ...}: {
  programs.starship = {
    enable = true;
    enableIonIntegration = false;
    enableFishIntegration = true;
    enableZshIntegration = true;

    # Pure Presets
    settings = {
      add_newline = true;
      right_format = lib.concatStrings [
        "$sudo"
        "$nix_shell"
        "\${custom.direnv}"
        "$time"
      ];
      continuation_prompt = "▶ ";
      command_timeout = 1000;
      character = {
      mauve = "#c6a0f6";
      maroon = "#ee99a0";
      success_symbol ="[[♥]($mauve) ❯]($maroon)";
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
      time = {
      format = "[](bg:$style)[ $time](fg:white bg:$style)[](fg:$red)";
      };
    };
  };
}
