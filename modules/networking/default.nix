{ config, lib, ... }:

{

  networking = {

    hostName = "Lunar";
    networkmanager.enable = true;

    # Configure network proxy if you want.
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost.internal.domain";

    # Firewall Configuration
    firewall.enable = true;
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
  };

}
