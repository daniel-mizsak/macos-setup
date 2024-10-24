# https://github.com/dejanr/dotfiles/blob/7feea7ef8ef542df5a47b2efffe4d87c605ea23e/hosts/mbp-work/system.nix
{ pkgs, vars, ... }:

{
  system = {
    stateVersion = 5;
    defaults = {
      NSGlobalDomain = {
        AppleActionOnDoubleClick = "Maximize";
        AppleInterfaceStyle = "Dark";
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        contents-immutable = true;
        launchanim = true;
        magnification = false;
        mineffect = "genie";
        minimize-to-application = false;
        orientation = "bottom";
        show-process-indicators = true;
        show-recents = false;
        size-immutable = true;
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
    };
  };
  activationScripts.postActivation.text = ''
    defaults write com.apple.finder NewWindowTarget -string "PfDo"
    defaults write com.apple.finder NewWindowTargetPath -string "file://Users/${vars.user}/Documents/"
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowRecentTags -bool false
    defaults write com.apple.finder ShowToolbar -bool true
    defaults write com.apple.finder WarnOnEmptyTrash -bool true
  '';
  security.pam.enableSudoTouchIdAuth = true;
}
