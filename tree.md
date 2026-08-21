nix/
├── flake.nix # Central entry point: ALL hosts, packages, shells
├── lib/
│ └── mkHost.nix # Factory: creates every NixOS machine
├── hosts/ # Per-machine hardware + host-specific config
│ ├── desktop/
│ ├── laptop/
│ ├── server/
│ └── rpi4/
├── modules/
│ ├── nixos/
│ │ ├── common/ # ALL hosts
│ │ ├── desktop/ # Desktop role
│ │ ├── server/ # Server role
│ │ └── security/ # Hardening
│ └── home-manager/
│ ├── common/ # ALL users
│ ├── desktop/ # Desktop users
│ └── dev/ # Developer users
├── profiles/
│ ├── system/ # Named feature sets (workstation, gaming, etc.)
│ └── users/ # Dynamic user generation
├── home/ # Per-user Home Manager configs
│ └── lin.nix
├── pkgs/ # Custom packages
├── overlays/ # Nixpkgs patches
├── disko/ # Declarative disk partitioning
├── secrets/ # sops-nix encrypted secrets
├── .github/workflows/ # CI/CD
└── docs/ # Documentation
