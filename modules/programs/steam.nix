{ config, lib, ...}:

{
  
  programs.steam = {
  enable = true;
  removePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
  }

}
