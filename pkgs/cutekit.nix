{ nixpkgs, system, ... }:

let
  pkgs = nixpkgs.legacyPackages.${system};
  python3Packages = pkgs.python3Packages;
in
python3Packages.buildPythonApplication {
  pname = "cutekit";
  version = "0.11.0";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "cute-engineering";
    repo = "cutekit";
    rev = "9c838f4f43224d9f6e2d0aaebbeb3cbc9cf48abd";
    sha256 = "sha256-AvGHqxaKA6pFyfGh5JbyzIdVeh6ULICZmecVOiDiO7s=";
  };

  dependencies =
    with python3Packages;
    [
      setuptools
      graphviz
      dataclasses-json
      tomli-w
    ]
    ++ [ pkgs.jq ];

  patches = [
    ./graphviz.patch
  ];

  meta = {
    description = "The *magical* build system and package manager";
    license = pkgs.lib.licenses.mit;
  };
}
