{ pkgs, vars, ... }:

{
  system = {
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleInterfaceStyle = "Dark";
      };
      dock = {
        tilesize = 60;
        magnification = false;
        orientation = "bottom";
        autohide = true;
        autohide-time-modifier = 0.0;
        autohide-delay = 0.0;
        persistent-apps = [
          "/Applications/Safari.app"
          "/System/Applications/Mail.app"
          "${pkgs.signal-desktop}/Applications/Signal.app"
          "${pkgs.vscode}/Applications/Visual\ Studio\ Code.app"
          "/System/Applications/System Settings.app"
        ];
        show-recents = false;
        persistent-others = [ "/Users/${vars.user}/Downloads/" ];
      };
    };
    stateVersion = 4;
  };
  security.pam.enableSudoTouchIdAuth = true;
}
