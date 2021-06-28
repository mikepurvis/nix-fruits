{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib;
    eachSystem allSystems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (import ./fruit.nix)
          ];
        };
      in {
        packages = pkgs;
      }) // {
        nixosModule = import ./modules;
      };
}
