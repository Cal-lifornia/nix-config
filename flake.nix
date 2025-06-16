{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";

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
      url = "github:danth/stylix/release-25.05";
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
      mkHome = import ./lib/mkhome.nix {
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
        desktop = mkSystem "desktop-nixos" {
          system = "x86_64-linux";
          username = "whobson";
          desktop = true;
        };
        wslnix = mkSystem "wsl-nix" {
          username = "whobson";
          system = "x86_64-linux";
          wsl = true;
        };
        proxmoxlxc = mkSystem "vm-nixos" {
          username = "whobson";
          system = "x86_64-linux";
          generator = true;
        };
      };
      homeConfigurations = {
        "whobson@traveler" = mkHome "macbook-pro-m2" {
          system = "aarch64-darwin";
          username = "whobson";
          desktop = true;
          darwin = true;
        };
        "whobson@citizen" = mkHome "vm-home" {
          system = "x86_64-linux";
          username = "whobson";
        };
        "whobson@variks" = mkHome "vm-home" {
          system = "x86_64-linux";
          username = "whobson";
        };
      };
    };
}
