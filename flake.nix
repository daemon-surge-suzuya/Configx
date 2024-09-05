{

  description = "Simple Flake based configs";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    nur = { url = "github:nix-community/NUR"; };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { self, nixpkgs, home-manager, spicetify-nix, nur, ... }@inputs: {
      nixosConfigurations.Lunar = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          nur.nixosModules.nur
          ./default.nix

          home-manager.nixosModules.home-manager
          {

            nixpkgs.overlays = [ nur.overlay ];
            home-manager.useGlobalPkgs = true;

            home-manager.users.moon = {
              imports = [ ./home.nix ./homes inputs.nur.hmModules.nur ];
            };
          }
        ];
      };
    };
}
