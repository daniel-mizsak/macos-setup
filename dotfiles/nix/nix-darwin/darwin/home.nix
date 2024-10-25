# https://mynixos.com/home-manager/option/home.stateVersion
# https://wiki.nixos.org/wiki/Home_Manager

{ pkgs, vars, ... }:

{
  home.username = vars.user;
  home.stateVersion = "24.05";

  home.packages = with pkgs; [ ];

  home.file = {
    ### Terminal
    # atuin
    ".config/atuin/config.toml".source = ~/macos-setup/dotfiles/config/atuin/config.toml;

    # fastfetch
    ".config/fastfetch/config.jsonc".source = ~/macos-setup/dotfiles/config/fastfetch/config.jsonc;

    # git
    ".gitconfig".source = ~/macos-setup/dotfiles/git/.gitconfig;
    ".gitignore_global".source = ~/macos-setup/dotfiles/git/.gitignore_global;
    ".gitmessage".source = ~/macos-setup/dotfiles/git/.gitmessage;

    # neovim
    ".config/nvim".source = ~/macos-setup/dotfiles/config/nvim;

    # oh-my-post
    ".config/oh-my-posh".source = ~/macos-setup/dotfiles/config/oh-my-posh;

    # tmux
    ".config/tmux/tmux.conf".source = ~/macos-setup/dotfiles/config/tmux/.tmux.conf;

    # yazi
    ".config/yazi/theme.toml".source = ~/macos-setup/dotfiles/config/yazi/theme.toml;

    ".zshrc".source = ~/macos-setup/dotfiles/shell/.zshrc;

    ### Package
    # alacritty
    ".config/alacritty/alacritty.toml".source = ~/macos-setup/dotfiles/config/alacritty/alacritty.toml;

    # sublime
    "/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings".source = ~/macos-setup/dotfiles/sublime/Preferences.sublime-settings;

    # vscode
    "/Library/Application Support/Code/User/settings.json".source = ~/macos-setup/dotfiles/vscode/settings.json;

    # wezterm
    ".config/wezterm/wezterm.lua".source = ~/macos-setup/dotfiles/config/wezterm/wezterm.lua;
  };

  programs.home-manager.enable = true;
  programs.zsh.enable = true;

}
