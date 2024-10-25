{ vars, ... }:

{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = vars.user;
  };
}
