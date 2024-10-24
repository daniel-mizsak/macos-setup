{ pkgs, vars, ... }:

{
  imports = (import ./modules);

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;

  users.users.${vars.user}.home = "/Users/${vars.user}";

  environment = {
    variables = {
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
    };
    systemPackages = with pkgs; [
      # Terminal
      atuin
      bat
      eza
      fastfetch
      fzf
      git
      htop
      lazydocker
      lazygit
      neovim
      oh-my-posh
      pyenv
      tmux
      tree
      wget
      zoxide
      # General
      aldente
      arc-browser
      obsidian
      raycast
      signal-desktop
      vscode
    ];
  };

}
