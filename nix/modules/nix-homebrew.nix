{ user }:

{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = user;
  };
}