# https://github.com/zmre/mac-nix-simple-example
# https://github.com/omerxx/dotfiles
# https://github.com/dreamsofautonomy/nix-darwin
# https://github.com/MatthiasBenaets/nix-config/blob/master/darwin.org

{
  description = "Setting up everything with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nix-darwin, nix-homebrew }:
  {
    darwinConfigurations = (
      # Everything macOS related
      import ./nix-darwin {
        inherit nixpkgs home-manager nix-darwin nix-homebrew;
      }
    );

    nixosConfigurations = (
      # NixOS virtual machine setup for both x86_64 and aarch64
      import ./nixos {
        inherit nixpkgs;
      }
    );

    homeConfigurations = (
      # Home Manager setup for the VMs
      import ./home-manager {
        inherit nixpkgs home-manager;
      }
    );
  };
}
