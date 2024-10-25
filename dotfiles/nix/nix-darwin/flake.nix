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
      ...
    }:
    let
      vars = {
        system = "aarch64-darwin";
        user = "damz";
      };
    in
    {
      darwinConfigurations.Mizsak-D-MBM = darwin.lib.darwinSystem {
        system = vars.system;
        pkgs = import nixpkgs {
          system = vars.system;
          config.allowUnfree = true;
        };

        specialArgs = {
          inherit
            nixpkgs
            home-manager
            darwin
            nix-homebrew
            vars
            ;
        };

        modules = [
          ./modules/darwin-system.nix
          ./modules/programs.nix

          nix-homebrew.darwinModules.nix-homebrew
          ./modules/nix-homebrew.nix

          home-manager.darwinModules.home-manager
          ./modules/home.nix
        ];
      };
    };
}
