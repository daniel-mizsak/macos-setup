# https://chocolatey.org/install

$apps = @(
    "7zip"
    "git"
    "notepadplusplus"
    "python"
)
foreach ($app in $apps) {
    choco install $app -y
}
