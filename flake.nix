{
  description = "Testing stm development in nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    naersk = {
      url = "github:nix-community/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay, naersk } @ inputs:
    let
      overlays = [rust-overlay.overlays.default];
    in flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs{ inherit system overlays;};
      in {
        packages = {
          default = pkgs.callPackage ./. {inherit inputs system;};
        };
        devShells = {

          default = pkgs.mkShell {
            inputsFrom = [ self.packages.${system}.default ];
            nativeBuildInputs = [
              pkgs.cargo-generate
              pkgs.qemu
            ];
            shellHook = ''
              alias emacs="emacs -nw"
            '';
          };
        };
      }
    );
}
