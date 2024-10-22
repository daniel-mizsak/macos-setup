# https://mynixos.com/home-manager/option/home.stateVersion
# https://wiki.nixos.org/wiki/Home_Manager

{ pkgs, vars, ... }:

{
  home.username = vars.user;
  home.HomeDirectory = "/Users/${vars.user}";
  home.stateVersion = "24.05";

  program.zsh = {
    enable = true;
    zshrcExtra = ''
      . $HOME/macos-setup/dotfiles/shell/.zshrc
    ''
  };

  home.packages = with pkgs; [ ];
}
