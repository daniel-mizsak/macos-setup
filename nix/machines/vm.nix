{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
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

  # services.xserver.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
  };

  # users.mutableUsers = false;
  users.users.damz = {
    isNormalUser = true;
    description = "Daniel Mizsak";
    extraGroups = [ "networkmanager" "wheel" ];
    home = "/home/damz";
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
      vscode
    ];
    # hashedPassword = "...";
  };

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  system.stateVersion = "24.11";
}
