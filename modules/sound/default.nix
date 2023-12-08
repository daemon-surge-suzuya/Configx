{ config, lib, ...}:

{

  # hardware.pulseaudio.enable = true;
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # Jack 
    # jack.enable = true;
  };

}
