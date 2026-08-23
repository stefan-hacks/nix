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
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          # hello = nixpkgsFor.${system}.hello;
          hello = pkgs.hello;

          # your custom expression
          study-hello = pkgs.runCommand "study-hello" { } ''
            mkdir -p $out/share
            echo "Hello from nix!" > $out/share/hello.txt
          '';
        }
      );

      devShells = forAllSystems (system: {
        default = nixpkgsFor.${system}.mkShell {
          packages = with nixpkgsFor.${system}; [
            hello
            git
            vim
            git-lfs
            gnumake
            cmake
            nixpkgs-fmt
            statix
            nil
            python311
            nodejs_22
          ];
          shellHook = ''
            echo  "Welcome to nix!"
            echo "This shell is defined in flake.nix"
            echo "Python: $(python3 --version)"
            echo "Node: $(node -- version)"
            echo ""
            echo "Repo: $(pwd)"
            echo "Run 'nix fmt' to format all .nix files"
          '';
        };
      });

      formatter = forAllSystems (system: nixpkgsFor.${system}.nixpkgs-fmt);
    };
}
