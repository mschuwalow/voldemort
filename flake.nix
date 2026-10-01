{
  description = "voldemort dev environment (java 8)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/5e2305d577ca00acbba631b05cb1094d172b29f3";
    old-nixpkgs = {
      url = "github:NixOS/nixpkgs?rev=2f6ef9aa6a7eecea9ff7e185ca40855f36597327";
      flake = false;
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, old-nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { system, pkgs, ... }:
        let
          oldPkgs = import old-nixpkgs {
            inherit system;
          };
        in {
          devShells.default = pkgs.callPackage ./nix/shell.nix {
            inherit oldPkgs;
          };
        };
    };
}
