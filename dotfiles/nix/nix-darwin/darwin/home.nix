# https://mynixos.com/home-manager/option/home.stateVersion
# https://wiki.nixos.org/wiki/Home_Manager

{ pkgs, vars, ... }:

{
  home.username = vars.user;
  home.HomeDirectory = "/Users/${vars.user}";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [ ];

  home.file = {
    ".zshrc".source = ~/macos-setup/dotfiles/shell/.zshrc;
    ".config/wezterm".source = ~/macos-setup/dotfiles/config/wezterm;
    ".config/oh-my-posh".source = ~/macos-setup/dotfiles/config/oh-my-posh;
    ".gitconfig".source = ~/macos-setup/dotfiles/git/.gitconfig;
  };

  programs.home-manager.enable = true;
  program.zsh.enable = true;

}
