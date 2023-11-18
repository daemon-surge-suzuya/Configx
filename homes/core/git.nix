_: {
  programs.git = {
    enable = true;

    userEmail = "daemonsurges@gmail.com";
    userName = "daemon-surge-suzuya";

    extraConfig = {
      init.defaultBranch = "master";
    };

    ignores = [
      ".venv"
      "*~"
      "*.swp"
      "*result*"
      ".direnv"
      "node_modules"
      "tmp"
    ];

    aliases = {
      a = "add -p";
      co = "checkout";
      cob = "checkout -b";
      f = "fetch -p";
      c = "commit -s";
      cl = "clone";
      ba = "branch -a";
      bd = "branch -d";
      bD = "branch -D";
      d = "diff";
      dc = "diff --cached";
      ds = "diff --staged";
      r = "restore";
      rs = "restore --staged";
      s = "status";
      st = "status -sb";
      p = "push";
      pl = "pull";

      # reset
      soft = "reset --soft";
      hard = "reset --hard";
      s1ft = "soft HEAD~1";
      h1rd = "hard HEAD~1";

    };
  };
}
