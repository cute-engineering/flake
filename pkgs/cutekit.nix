{ nixpkgs, system, ... }:

let
  pkgs = nixpkgs.legacyPackages.${system};
  python3Packages = pkgs.python3Packages;
in
python3Packages.buildPythonApplication {
  pname = "cutekit";
  version = "0.8.6";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "cute-engineering";
    repo = "cutekit";
    rev = "0e49eb181367f427d9084df43b8a713a60a3bf4e";
    sha256 = "sha256-0nWe9pqYW9P7nqh7dnwrFwFW3/nhDz4RopD18HiR4ww=";
  };

  dependencies = with python3Packages; [
    setuptools
    graphviz
    dataclasses-json
  ];

  meta = with pkgs.lib; {
    description = "The *magical* build system and package manager";
    license = pkgs.lib.licenses.mit;
  };
}
