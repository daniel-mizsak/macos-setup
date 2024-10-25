# https://github.com/dejanr/dotfiles/blob/7feea7ef8ef542df5a47b2efffe4d87c605ea23e/hosts/mbp-work/system.nix
{ pkgs, vars, ... }:

{
  nix.configureBuildUsers = true;
  nix.settings.experimental-features = "nix-command flakes";
  nix.useDaemon = true;
  services.nix-daemon.enable = true;
  users.users.${vars.user}.home = "/Users/${vars.user}";

  system = {
    stateVersion = 5;
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
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
          "${pkgs.signal-desktop}/Applications/Signal.app"
          "${pkgs.vscode}/Applications/Visual\ Studio\ Code.app"
          "/System/Applications/System Settings.app"
        ];
        persistent-others = [ "/Users/${vars.user}/Downloads/" ];
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = true;
        FXPreferredViewStyle = "clmv";
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      trackpad = {
        Clicking = true;
        Dragging = true;
      };
      CustomUserPreferences = {
        "com.apple.controlcenter.plist".BatteryShowPercentage = true;
        "com.apple.dock" = {
          contents-immutable = true;
          size-immutable = true;
        };
        "com.apple.finder" = {
          NewWindowTarget = "PfDo";
          NewWindowTargetPath = "file://Users/${vars.user}/Documents/";
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = true;
          ShowRecentTags = false;
          ShowToolbar = true;
          WarnOnEmptyTrash = false;
        };
        "com.apple.menuextra.clock" = {
          DateFormat = "HH:mm";
          FlashDateSeparators = false;
          Show24Hour = true;
        };
      };
      WindowManager.EnableStandardClickToShowDesktop = false;
    };
  };
  security.pam.enableSudoTouchIdAuth = true;
}
