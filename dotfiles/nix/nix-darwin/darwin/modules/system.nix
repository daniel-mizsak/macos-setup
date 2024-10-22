{ pkgs }:

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
        autohide-time-modifier = 0;
        autohide-delay = 0;
        persistent-apps = [
          "/Applications/Safari.app"
          "/Applications/Mail.app"
          "/Applications/Signal.app"
          "${pkgs.vscode}/Applications/Visual\ Studio\ Code.app"
          "/Applications/System\ Settings.app"
          "${HOME}/Downloads"
        ];
      };
      security = {
        pam.enableSudoTouchID = true;
      }
    };
    stateVersion = 4;
  };
}
