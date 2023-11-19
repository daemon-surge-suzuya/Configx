{pkgs, ...}: {
  environment.systemPackages = with pkgs; [xfce.thunar];

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  services = {
    gvfs.enable = true; 
    tumbler.enable = true; 
  };
}
