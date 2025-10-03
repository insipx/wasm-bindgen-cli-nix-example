# Flake Shell for building release artifacts for swift and kotlin
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts = { url = "github:hercules-ci/flake-parts"; };
    systems.url = "github:nix-systems/default";
  };

  nixConfig = {
    extra-trusted-public-keys = "xmtp.cachix.org-1:nFPFrqLQ9kjYQKiWL7gKq6llcNEeaV4iI+Ka1F+Tmq0=";
    extra-substituters = "https://xmtp.cachix.org";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      perSystem = { pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.lld pkgs.cargo pkgs.wasm-bindgen-cli_0_2_100 ];
        };
      };
    };
}










