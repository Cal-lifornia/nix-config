{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, home-manager, ... }@inputs:
    {
      nixosConfigurations = {
        default = let 
          username = "whobson";
          specialArgs = {inherit username;};
        in  
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
          modules = [
            ./hosts/default/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPkgs = true;

                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = import ./users/${username}/home.nix;
              }
          ];
        };
        server = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/server/configuration.nix
          ];
        };
      };
    };
}
