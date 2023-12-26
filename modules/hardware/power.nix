{ config, lib, pkgs, ... }:

{

  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  # services.tlp.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "performance";
      turbo = "always";
    };
    charger = {
      governor = "performance";
      turbo = "always";
    };
  };

}
