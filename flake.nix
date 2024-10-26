{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "gihub:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    { self, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86-64-linux";
      pkgs = import nixpkgs {
       inherit system;
        config.allowUnfree = true;  
      };

      lib = nixpkgs.lib;   
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in 
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            cachix
            lorri
            niv
            nixfmt-classic
            statix
            vulnix
            haskellPackages.dhall-nix
          ];
        };
      });

      nixosConfigurations = {
        desktop = let 
          username = "whobson";
          specialArgs = {inherit username; inherit hyprland;};
        in  
          nixpkgs.lib.nixosSystem rec{
            inherit system;
            inherit specialArgs;
          modules = [
            ./hosts/desktop
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = import ./home/home.nix;
              }
          ];
        };
      };
    };
}
