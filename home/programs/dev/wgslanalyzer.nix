{ pkgs, ... }:

pkgs.rustPlatform.buildRustPackage {
  name = "wgsl-analyzer";
  version = "0.9.9";
  src = pkgs.fetchFromGitHub {
    owner = "wgsl-analyzer";
    repo = "wgsl-analyzer";
    rev = "5d3756806ca2cfba8ea43519d0f978f5e72ed2de";
    sha256 = "sha256-KasJXKyXNm3AERLeJ+EPJG++egSPQEsUBj4FgMqmzAg=";
  };

  cargoHash = "sha256-UKt1usU8pgJ9ljZEVVQoXxaLoHMQ9LXueNjsFk+abyI";
}
