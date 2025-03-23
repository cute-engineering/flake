{
  description = "Cutekit's Nix repo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (
      system:
      let
        cutekit = nixpkgs.legacyPackages.${system}.callPackage ./pkgs/cutekit.nix {
          inherit nixpkgs system;
        };
      in
      {
        packages = {
          cutekit = cutekit;
        };
      }
    );
}
