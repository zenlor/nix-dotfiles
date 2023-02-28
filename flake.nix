{
  description = "wip nix configs";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NixDarwin
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    emacs-overlay.url  = "github:nix-community/emacs-overlay";

    homeage.url = "github:jordanisaacs/homeage";
    homeage.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs
    , home-manager
    , darwin
    , ... } @inputs :
    rec {
      defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
      defaultPackage.aarch64-linux = home-manager.defaultPackage.aarch64-linux;

      defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
      defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

      nixosConfigurations = {
        nas = nixpkgs.lib.nixosSystem {
          pkgs = defaultPackage.x86_64-linux;
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          # > main nixos configuration file <
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };

      darwinConfigurations = {
        "MWB-C02XL3VCJGH5" = darwin.lib.darwinSystem {
          pkgs = defaultPackage.x86_64-darwin;

          modules = [
            ./darwin/mwb.nix
          ];
        };
        "MWB-RH4YYY222F" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";#defaultPackage.aarch64-darwin; # "aarch64-darwin";
          modules = [ ./darwin/mwb.nix ];
        };
        "mwb" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";#defaultPackage.aarch64-darwin; # "aarch64-darwin";
          modules = [ ./darwin/mwb.nix ];
        };
      };

      homeConfigurations = {
        "lgiuliani" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;

          extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config

          modules = [
            ./home/default.nix
            ./home/lgiuliani.nix
          ];
        };

        "lor" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config

          modules = [
            ./home/default.nix
            ./home/lor.nix
          ];
        };
      };
    }
    ;
  }
