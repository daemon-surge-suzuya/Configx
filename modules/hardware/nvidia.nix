{ config, lib, pkgs, ... }:

{
  
  boot.kernelParams = [ "nouveau" ];

  hardware = {
    
      opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
      extraPackages32 = with pkgs.pkgsi686Linux ; [ nvidia-vaapi-driver ];
    
    };
    
    nvidia = {

      forceFullCompositionPipeline = true;
      modesetting.enable = true;
      open = false; # Use OpenSource
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      
      prime = {
      
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

     };
    };
  };

}
