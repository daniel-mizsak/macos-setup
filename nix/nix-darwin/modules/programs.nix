{ pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "Meslo" ]; }) ];

  # Nix
  environment = {
    variables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";
      TERMINAL = "wezterm";
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
      tree
      wget
      yazi
      zoxide
      # General
      alacritty
      aldente
      arc-browser
      iterm2
      lens
      obsidian
      postman
      raycast
      signal-desktop
      slack
      vscode
    ];
  };

  # Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      upgrade = false;
      cleanup = "zap";
    };
    casks = [
      "1password"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "betterdisplay"
      "boosteroid"
      "db-browser-for-sqlite"
      "devtoys"
      "docker"
      "github"
      "hiddenbar"
      "keyboardcleantool"
      "mullvadvpn"
      "obs"
      "openinterminal"
      "parallels@19"
      "podman-desktop"
      "raspberry-pi-imager"
      "scroll-reverser"
      "spotify"
      "sublime-text"
      "synology-drive"
      "updf"
      "vlc"
      "vnc-viewer"
      "wezterm"
    ];
    masApps = {
      # General
      "Compressor" = 424390742;
      "Final Cut Pro" = 424389933;
      "Keynote" = 409183694;
      "Magnet" = 441258766;
      "Motion" = 434290957;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Windows App" = 1295203466;
      "Xcode" = 497799835;
      # Safari Extensions
      "1Password for Safari" = 1569813296;
      "AdGuard for Safari" = 1440147259;
      "Speed Player for Safari" = 1521133201;
      "SponsorBlock for YouTube" = 1573461917;
    };
  };
}
