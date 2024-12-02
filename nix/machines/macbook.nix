{ currentSystemUser, ... }: {

  nix = {
    configureBuildUsers = true;
    gc.automatic = true;
    optimise.automatic = true;
    settings.experimental-features = "nix-command flakes";
    useDaemon = true;
  };
  security.pam.enableSudoTouchIdAuth = true;
  services.nix-daemon.enable = true;

  system = {
    stateVersion = 5;

    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
      };
      controlcenter = {
        BatteryShowPercentage = true;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        launchanim = true;
        magnification = false;
        mineffect = "genie";
        minimize-to-application = false;
        orientation = "bottom";
        show-process-indicators = true;
        show-recents = false;
        tilesize = 60;
        persistent-apps = [
          "/Applications/Safari.app"
          "/System/Applications/Mail.app"
          "/Applications/Signal.app"
          "/Applications/Visual\ Studio\ Code.app"
          "/System/Applications/System Settings.app"
        ];
        persistent-others = [ "/Users/${currentSystemUser}/Downloads/" ];
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = true;
        FXPreferredViewStyle = "clmv";
        FXRemoveOldTrashItems = false;
        QuitMenuItem = true;
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = false;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      CustomUserPreferences = {
        "com.apple.desktopservices".DSDontWriteNetworkStores = true;
        "com.apple.dock" = {
          contents-immutable = true;
          size-immutable = true;
        };
        "com.apple.finder" = {
          NewWindowTarget = "PfDo";
          NewWindowTargetPath = "file://Users/${currentSystemUser}/Documents/";
          ShowRecentTags = false;
          ShowToolbar = true;
          WarnOnEmptyTrash = false;
        };
      };
      WindowManager.EnableStandardClickToShowDesktop = false;
    };
  };

  users.users.${currentSystemUser} = {
    name = currentSystemUser;
    home = "/Users/${currentSystemUser}";
  };
}
