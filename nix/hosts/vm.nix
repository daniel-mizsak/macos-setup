{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  ### Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ### Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  ### Locale
  time.timeZone = "Europe/Budapest";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "hu_HU.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  ### Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  ### SSH
  services.openssh = {
    enable = true;
    ports = [ 22 ];
  };

  ### Users
  users.mutableUsers = false;
  users.users.damz = {
    isNormalUser = true;
    description = "Daniel Mizsak";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    home = "/home/damz";
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
      vscode
    ];
    hashedPassword = "$y$j9T$SLcpv.fvXbk2PqUEOuHVL0$VZUxN7P8EXwsXVxCvReON7tOrV/ARfd.oyCQ3trt5aA";
  };

  # No password for sudo
  security.sudo.extraRules = [
    {
      users = [ "damz" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  ### Packages
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  system.stateVersion = "24.11";
}
