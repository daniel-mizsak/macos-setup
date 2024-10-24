# https://github.com/dustinlyons/nixos-config
{ pkgs, vars, ... }:

{
  imports = (import ./modules);

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;

  users.users.${vars.user}.home = "/Users/${vars.user}";

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Meslo" ]; })
  ];

  environment = {
    variables = {
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
    };
    systemPackages = with pkgs; [
      # Terminal
      atuin
      bat
      dotnet-sdk
      eza
      fastfetch
      fd
      ffmpegthumbnailer
      fzf
      git
      htop
      imagemagick
      jq
      lazydocker
      lazygit
      neovim
      oh-my-posh
      poppler
      pyenv
      ripgrep
      tmux
      tmuxPlugins.catppuccin
      tmuxPlugins.continuum
      tmuxPlugins.resurrect
      tmuxPlugins.vim-tmux-navigator
      tree
      wget
      yazi
      zoxide
      zsh-autosuggestions
      zsh-fzf-tab
      zsh-syntax-highlighting
      # General
      alacritty
      aldente
      arc-browser
      docker
      iterm2
      obsidian
      podman
      podman-compose
      postman
      raycast
      signal-desktop
      slack
      spotify
      synology-drive-client
      vscode
      wezterm
    ];
  };

}
