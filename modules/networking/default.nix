{ config, lib, ...}:

{

  networking.hostName = "Lunar";
  networking.networkmanager.enable = true;
  
  # Configure network proxy if you want.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost.internal.domain";
  
  # Firewall Configuration
  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

}
