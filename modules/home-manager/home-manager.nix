{ inputs, ... }:
{
  home-manager."whobson" = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "whobson" = import ./home.nix;
      modules = [
        ./home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
