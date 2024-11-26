{
  description = "A flake that aliases opentofu's tofu binary as terraform";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = rec {
          opentofu = pkgs.opentofu;
          terraform = pkgs.runCommand "terraform" { buildInputs = [ pkgs.makeWrapper ]; } ''
            mkdir -p $out/bin
            ln -s ${opentofu}/bin/tofu $out/bin/terraform
          '';
          default = terraform;
        };

        formatter = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
      });
}
