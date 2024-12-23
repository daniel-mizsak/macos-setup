{ pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
  ];

  # Nix
  environment = {
    variables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";
      TERMINAL = "wezterm";
    };
    systemPackages = with pkgs; [
      # Terminal
      _1password-cli
      atuin
      bat
      btop
      cabal-install
      direnv
      eza
      fastfetch
      fd
      ffmpegthumbnailer
      fzf
      gcc
      ghc
      git
      htop
      imagemagick
      jq
      kubectl
      lazydocker
      lazygit
      neovim
      nixfmt-rfc-style
      oh-my-posh
      poppler
      pre-commit
      ripgrep
      tlrc
      tmux
      tree
      wget
      yazi
      zoxide

      dotnet-sdk_8
      go
      pyenv
    ];
  };
}
