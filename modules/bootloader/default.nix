{ config, lib, pkgs, ...}:

{

  boot.kernelParams = [ "nouveau" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = with config.boot.kernelPackages ; [ rtl88xxau-aircrack ];

  # Set Kernel parameters for NVIDIA graphics.
  # boot.kernelParams = [ "nvidia-drm.modeset = 1" "initcall_blacklist=simpledrm_platform_driver_init" ];

}
