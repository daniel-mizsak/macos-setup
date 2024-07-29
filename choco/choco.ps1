$apps = @(
    "7zip"
    "git"
    "notepadplusplus"
    "python"
    "wezterm"
)
foreach ($app in $apps) {
    choco install $app -y
}
