{
  description = "My NixOS config";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Pinned commit; left on its own nixpkgs so it keeps building
    helix-master.url = "github:helix-editor/helix?rev=72d583700adf1f0e4e79356662b563cd3a76ab88";
    nixgl = {
      url = "github:nix-community/nixGl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              cachix
              nixfmt
              statix
              vulnix
              haskellPackages.dhall-nix
            ];
          };
        };

      flake =
        let
          mkHome = import ./lib/mkhome.nix {
            inherit nixpkgs inputs;
          };
        in
        {
          homeConfigurations = builtins.mapAttrs mkHome {
            "whobson@traveler" = {
              system = "aarch64-darwin";
              username = "whobson";
              desktop = true;
              darwin = true;
            };
            "whobson@citizen" = {
              system = "x86_64-linux";
              username = "whobson";
            };
            "whobson@variks" = {
              system = "x86_64-linux";
              username = "whobson";
            };
            "whobson@hyperion" = {
              system = "x86_64-linux";
              username = "whobson";
              desktop = true;
            };
          };
        };
    };
}
