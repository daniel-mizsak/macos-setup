{ ... }:

{
  nix-homebrew.darwinModules.nix-homebrew = {
    nix-homebrew = {
      enable = true;
      enableRosetta = true;
      user = vars.user;
    };
  };
}
