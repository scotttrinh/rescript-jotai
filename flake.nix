{
  description = "rescript-jotai";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs;
              [
                nixpkgs-fmt
                nodejs-18_x
              ];
          };
        });
}
