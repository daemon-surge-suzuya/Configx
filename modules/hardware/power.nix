{ config, lib, pkgs, ... }:

{

  powerManagement.enable = true;
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  services.tlp.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "always";
    };
    charger = {
      governor = "performance";
      turbo = "always";
    };
  };

}
