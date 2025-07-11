{ pkgs-stable, ... }:

pkgs-stable.rustPlatform.buildRustPackage {
  name = "wgsl-analyzer";
  version = "0.9.10";
  src = pkgs-stable.fetchFromGitHub {
    owner = "wgsl-analyzer";
    repo = "wgsl-analyzer";
    tag = "v0.9.10";
    sha256 = "sha256-KasJXKyXNm3AERLeJ+EPJG++egSPQEsUBj4FgMqmzAg=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-UKt1usU8pgJ9ljZEVVQoXxaLoHMQ9LXueNjsFk+abyI";
}
