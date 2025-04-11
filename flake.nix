{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";

      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin.url = "github:catppuccin/nix";
    helix-master.url = "github:helix-editor/helix";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      hyprland,
      catppuccin,
      helix-master,
      nixos-generators,
      nixos-wsl,
      stylix,
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
      mkSystem = import ./lib/mksystem.nix {
        inherit nixpkgs inputs;
      };
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
              nil
            ];
          };
        }
      );

      nixosModules.myFormats =
        { config, ... }:
        {
          imports = [
            nixos-generators.nixosModules.all-formats
          ];

          nixpkgs.hostPlatform = "x86_64-linux";
        };

      nixosConfigurations = {
        desktop =
          let
            username = "whobson";
            system = "x86_64-linux";
            pkgs-stable = nixpkgs-stable.legacyPackages.${system};
            specialArgs = {
              inherit username;
              inherit hyprland;
              inherit catppuccin;
              inherit helix-master;
              inherit pkgs-stable;
              inherit stylix;
            };
          in
          nixpkgs.lib.nixosSystem rec {
            inherit specialArgs;
            modules = [
              catppuccin.nixosModules.catppuccin
              stylix.nixosModules.stylix
              ./hosts/desktop
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = {
                  imports = [
                    ./hosts/desktop/home.nix
                    catppuccin.homeModules.catppuccin
                    # stylix.homeManagerModules.stylix
                  ];
                };
              }
            ];
          };
        wslnix =
          let
            username = "whobson";
            system = "x86_64-linux";
            pkgs-stable = nixpkgs-stable.legacyPackages.${system};
            specialArgs = {
              inherit username;
              inherit catppuccin;
              inherit helix-master;
              inherit pkgs-stable;
            };
          in

          nixpkgs.lib.nixosSystem rec {
            inherit specialArgs;
            modules = [
              catppuccin.nixosModules.catppuccin
              ./hosts/wslnix
              nixos-wsl.nixosModules.default
              self.nixosModules.myFormats
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = {
                  imports = [
                    ./hosts/wslnix/home.nix
                    catppuccin.homeModules.catppuccin
                  ];
                };
              }
            ];
          };
        proxmoxlxc =
          let
            username = "whobson";
            system = "x86_64-linux";
            pkgs-stable = nixpkgs-stable.legacyPackages.${system};
            specialArgs = {
              inherit username;
              inherit catppuccin;
              inherit helix-master;
              inherit pkgs-stable;
            };
          in

          nixpkgs.lib.nixosSystem rec {
            inherit specialArgs;
            modules = [
              catppuccin.nixosModules.catppuccin
              ./hosts/vm
              self.nixosModules.myFormats
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = {
                  imports = [
                    ./hosts/vm/home.nix
                    catppuccin.homeModules.catppuccin
                  ];
                };
              }
            ];
          };
      };
      homeConfigurations = {
        "whobson@traveler" = mkSystem "macbook-pro-m2" {
          system = "aarch64-darwin";
          user = "whobson";
          darwin = true;
          homeManaged = true;
        };
        "serveradmin@citizen" =
          let
            username = "serveradmin";
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
            extraSpecialArgs = inputs // specialArgs;
            modules = [
              ./hosts/wsl/home.nix
              catppuccin.homeModules.catppuccin
            ];
          };
        "whobson@variks" =
          let
            username = "whobson";
            specialArgs = {
              inherit username;
              inherit catppuccin;
              inherit helix-master;
            };
            pkgs = import nixpkgs {
              config.allowUnfree = true;
              system = "aarch64-linux";
            };
          in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = inputs // specialArgs;
            modules = [
              ./hosts/pi/home.nix
              catppuccin.homeModules.catppuccin
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
            extraSpecialArgs = inputs // specialArgs;
            modules = [
              ./hosts/wslnix/home.nix
              catppuccin.homeModules.catppuccin
            ];
          };

      };
    };
}
