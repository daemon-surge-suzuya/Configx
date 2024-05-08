{ config, lib, pkgs, ... }:

{

  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  # powerManagement.powertop.enable = true;
  # services.thermald.enable = true;
  # services.auto-cpufreq.enable = false;
  services.tlp = {
    enable = true;
    settings = { 
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 40;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 20;
      CPU_MAX_PERF_ON_BAT = 50;

      START_CHARGE_THRESH_BAT0 = 40; 
      STOP_CHARGE_THRESH_BAT0 = 80; 
      
    };
  };
  # services.auto-cpufreq.settings = {
  #   battery = {
  #     governor = "powersave";
  #     turbo = "always";
  #   };
  #   charger = {
  #     governor = "performance";
  #     turbo = "always";
  #   };
  # };

  # hardware.system76.enableAll = true;
}
