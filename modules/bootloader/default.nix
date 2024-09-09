{ config, lib, pkgs, ... }:

{

  boot = {

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    extraModulePackages = with config.boot.kernelPackages ; [ rtl88xxau-aircrack ];
    blacklistedKernelModules = [ "nouveau" ];
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxKernel.packages.linux_6_8;

    # Set Kernel parameters for NVIDIA graphics.
    # kernelParams = [ "nvidia-drm.modeset = 1" "initcall_blacklist=simpledrm_platform_driver_init" ];

  };

}
