# https://mynixos.com/home-manager/option/home.stateVersion
# https://wiki.nixos.org/wiki/Home_Manager

{ config, pkgs, user, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "b6e1b22458a131f835c6fe65bdb88eb45093d2d2";
          hash = "sha256-4A7zpaO1rNPvS0rrmmxg56rJGpZHnw/g+x5FJd0EshI=";
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "0.7.0";
          hash = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.8.0";
          hash = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
        };
      }
    ];
  };

  home = {
    stateVersion = "24.11";
    username = user;

    file = {
      ### Terminal
      # atuin
      ".config/atuin/config.toml".source = ~/macos-setup/dotfiles/config/atuin/config.toml;

      # bat
      ".config/bat/themes/Catppuccin Mocha.tmTheme".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/catppuccin/bat/refs/heads/main/themes/Catppuccin%20Mocha.tmTheme";
        sha256 = "sha256-UBuh6EeUhD5V9TjAo7hBRaGCt3KjkkO7QDxuaEBzN0s=";
      };
      ".config/bat/themes/Catppuccin Mocha.tmTheme".onChange = "bat cache --build";

      # fastfetch
      ".config/fastfetch/config.jsonc".source = ~/macos-setup/dotfiles/config/fastfetch/config.jsonc;

      # git
      ".gitconfig".source = ~/macos-setup/dotfiles/git/.gitconfig;
      ".gitignore_global".source = ~/macos-setup/dotfiles/git/.gitignore_global;
      ".gitmessage".source = ~/macos-setup/dotfiles/git/.gitmessage;

      # neovim
      ".config/nvim".source = mkOutOfStoreSymlink ~/macos-setup/dotfiles/config/nvim;

      # oh-my-posh
      ".config/oh-my-posh/oh-my-posh.toml".source = ~/macos-setup/dotfiles/config/oh-my-posh/oh-my-posh.toml;

      # tmux
      ".config/tmux/tmux.conf".source = ~/macos-setup/dotfiles/config/tmux/.tmux.conf;
      ".tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tpm";
        rev = "v3.1.0";
        sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
      };

      # yazi
      ".config/yazi/theme.toml".source = ~/macos-setup/dotfiles/config/yazi/theme.toml;
      ".config/yazi/theme.toml".onChange = "ya pack -a yazi-rs/flavors:catppuccin-mocha";

      # zsh
      ".zshrc".source = mkOutOfStoreSymlink ~/macos-setup/dotfiles/shell/.zshrc;

      ### Package
      # alacritty
      ".config/alacritty/alacritty.toml".source = mkOutOfStoreSymlink ~/macos-setup/dotfiles/config/alacritty/alacritty.toml;

      # sublime
      "/Users/${user}/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings".source = mkOutOfStoreSymlink ~/macos-setup/dotfiles/sublime/Preferences.sublime-settings;

      # vscode
      "/Users/${user}/Library/Application Support/Code/User/settings.json".source = mkOutOfStoreSymlink ~/macos-setup/dotfiles/vscode/settings.json;

      # wezterm
      ".config/wezterm/wezterm.lua".source = mkOutOfStoreSymlink ~/macos-setup/dotfiles/config/wezterm/wezterm.lua;
    };
  };
}
