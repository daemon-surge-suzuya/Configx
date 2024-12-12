{

  description = "Simple Flake based configs";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    nur = { url = "github:nix-community/NUR"; };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { self, nixpkgs, home-manager, spicetify-nix, nur, ... }@inputs: {
      nixosConfigurations.Lunar = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          # nur.nixosModules.nur
          nur.modules.nixos.default
          ./default.nix

          home-manager.nixosModules.home-manager
          {

            nixpkgs.overlays = [ nur.overlays.default ];
            home-manager.useGlobalPkgs = true;

            home-manager.users.moon = {
              imports = [ ./home.nix ./homes inputs.nur.modules.homeManager.default ];
            };
          }
        ];
      };
    };
}
