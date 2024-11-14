{
  pkgs,
  ...
}:

pkgs.rustPlatform.buildRustPackage rec {
  name = "kdlfmt";
  version = "v0.0.5";
  src = pkgs.fetchFromGitHub {
    owner = "hougesen";
    repo = "kdlfmt";
    rev = version;
    sha256 = "sha256-5wap6PoD6MEjjJkXcejX1arPdpJB/zIFv9+C8aeCkQg=";
  };
  cargoHash = "sha256-G+HVFD5yBtS5OD1b01GeLcm2CZw0lYB8cvJMEUwZ0Wg=";
}
