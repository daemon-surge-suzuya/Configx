{ ... }:
{
  services.redshift = {

    enable = true;
    
    temperature = {
      day = 3700;
      night = 3700;
    };
   
   # dawnTime = "5:30 - 6:00";
   # duskTime = "18:20 - 18:30";
  
   longitude = "77.429120";
   latitude = "28.584669";

  };

}
