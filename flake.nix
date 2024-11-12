{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin.url = "github:catppuccin/nix";
    helix-master.url = "github:helix-editor/helix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      hyprland,
      catppuccin,
      helix-master,
      ...
    }@inputs:
    let
      pkgs = import nixpkgs {
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSupportedSystem =
        f: nixpkgs.lib.genAttrs supportedSystems (system: f { pkgs = import nixpkgs { inherit system; }; });
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              cachix
              lorri
              niv
              nixfmt-rfc-style
              statix
              vulnix
              haskellPackages.dhall-nix
            ];
          };
        }
      );

      nixosConfigurations = {
        desktop =
          let
            username = "whobson";
            specialArgs = {
              inherit username;
              inherit hyprland;
              inherit catppuccin;
              inherit helix-master;
            };
          in
          nixpkgs.lib.nixosSystem rec {
            inherit specialArgs;
            system = "x86_64-linux";
            modules = [
              catppuccin.nixosModules.catppuccin
              ./hosts/desktop
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = {
                  imports = [
                    ./hosts/desktop/home.nix
                    catppuccin.homeManagerModules.catppuccin
                  ];
                };
              }
            ];
          };
        server =
          let
            username = "serveradmin";
            specialArgs = {
              inherit username;
              inherit catppuccin;
              inherit helix-master;
            };
          in
          nixpkgs.lib.nixosSystem rec {
            inherit specialArgs;
            system = "x86_64-linux";
            modules = [
              catppuccin.nixosModules.catppuccin
              ./hosts/server
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = {
                  imports = [
                    ./hosts/server/home.nix
                    catppuccin.homeManagerModules.catppuccin
                  ];
                };
              }
            ];
          };
      };
      homeConfigurations = {
        "whobson@traveler" =
          let
            username = "whobson";
            specialArgs = {
              inherit username;
              inherit catppuccin;
              inherit helix-master;
            };
            pkgs = import nixpkgs {
              config.allowUnfree = true;
              system = "aarch64-darwin";
            };
          in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit inputs;
              inherit username;
              inherit helix-master;
            };
            modules = [
              ./hosts/traveler/home.nix
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        "whobson@hyperion" =
          let
            username = "whobson";
            specialArgs = {
              inherit username;
              inherit catppuccin;
              inherit helix-master;
            };
            pkgs = import nixpkgs {
              config.allowUnfree = true;
              system = "x86_64-linux";
            };
          in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit inputs;
              inherit username;
              inherit helix-master;
            };
            modules = [
              ./hosts/wsl/home.nix
              catppuccin.homeManagerModules.catppuccin
            ];
          };
      };
    };
}
