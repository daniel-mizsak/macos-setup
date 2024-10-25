# https://github.com/zmre/mac-nix-simple-example
# https://github.com/omerxx/dotfiles
# https://github.com/dreamsofautonomy/nix-darwin
# https://github.com/MatthiasBenaets/nix-config/blob/master/darwin.org

{
  description = "MacOS setup with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      darwin,
      nix-homebrew,
    }:
    let
      vars = {
        system = "aarch64-darwin";
        user = "damz";
      };
    in
    {
      darwinConfigurations.Mizsak-D-MBM = darwin.lib.darwinSystem {
          specialArgs = { inherit inputs; };

          system = vars.system;
          pkgs = inputs.nixpkgs {
            system = vars.system;
            config.allowUnfree = true;
          };
          nix.settings.experimental-features = "nix-command flakes";
          services.nix-daemon.enable = true;

          modules = [
            ./modules/nix-homebrew.nix
            ./modules/home.nix
            ./modules/darwin-system.nix
            ./modules/programs.nix
          ];
        };
    };
}
