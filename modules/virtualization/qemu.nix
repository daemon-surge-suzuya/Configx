{pkgs, ...}: {
  virtualisation = {

    libvirtd = {
      enable = true;
      qemu = {
        verbatimConfig = ''
          nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd" ]
        '';
      };
    };
    
    spiceUSBRedirection.enable = true;
  
  };

  programs.virt-manager.enable = true;
  programs.dconf.enable = true;

  environment = {
    systemPackages = with pkgs; [
      virt-viewer
      qemu
      OVMF
      gvfs 
    ];
  };
}
