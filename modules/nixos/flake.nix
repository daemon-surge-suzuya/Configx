{

  description = "Simple Flake based configs";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    yazi = {
      url = "github:sxyazi/yazi";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nh, home-manager, spicetify-nix, yazi, ... }@inputs: {
    nixosConfigurations.Lunar = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        (import ./default.nix inputs)

        home-manager.nixosModules.home-manager
        {

          home-manager.useGlobalPkgs = true;

          home-manager.users.moon = import /home/moon/.config/home-manager/home.nix;
        }
      ];
    };
  };
}
