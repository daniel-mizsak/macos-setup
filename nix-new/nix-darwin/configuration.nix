{ nixpkgs, ... }:

{
  nix = {
    configureBuildUsers = true;
    gc.automatic = true;
    optimise.automatic = true;
    settings.experimental-features = "nix-command flakes";
    useDaemon = true;
  };
  services.nix-daemon.enable = true;

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };
}
