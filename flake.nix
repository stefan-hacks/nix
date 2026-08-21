{
  description = "nix - production-grade NixOS fleet";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      nixpkgsFor = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
    in
    {
      packages = forAllSystems (system: {
        hello = nixpkgsFor.${system}.hello;
      });

      devShells = forAllSystems (system: {
        default = nixppkgsFor.${system}.mkShell {
          packages = with nixpkgsFor.${system}; [
            hello
            git
            vim
          ];
          shellHook = ''
            echo  "Welcome to nix!"
            echo "This shell is defined in flake.nix"
          '';
        };
      });

      formatter = forAllSystems (systems: nixpkgsFor.${system}.nixpkgs-fmt);
    };
}
