{ nixpkgs, system, ... }:

let
  pkgs = nixpkgs.legacyPackages.${system};
  python3Packages = pkgs.python3Packages;
in
python3Packages.buildPythonApplication {
  pname = "cutekit";
  version = "0.10.2";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "cute-engineering";
    repo = "cutekit";
    rev = "790d9443aa2a50e3d0d9afe815a6fe731644f0cc";
    sha256 = "sha256-Z+SFQ7ZiXtzAmmYAbeTdBKXwc7vgwDEvjcrH92DAgEk=";
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
