# User Account Configuration
{ config, lib, pkgs, ... }:

{
  users.users.moon = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "moon";
    extraGroups = [ "networkmanager" "wheel" "wireshark" "adbusers" "libvirtd" ];
    packages = with pkgs; [
      # Uncomment packages you want to install for the user.
      # firefox
    ];
  };
}

