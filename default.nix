{pkgs, lib, inputs, system}:
let
  toolchain = pkgs.rust-bin.beta.latest.default.override {
    targets = [ "thumbv7em-none-eabihf" ];
    extensions = [ "llvm-tools" ];
  };
  naersk' = inputs.naersk.lib.${system}.override {
    cargo = toolchain;
    rustc = toolchain;
  };
in
  naersk'.buildPackage {
    src = ./.;
    nativeBuildInputs = with pkgs; [
      cargo-binutils
    ];
    CARGO_BUILD_TARGET = "thumbv7em-none-eabihf";
}
