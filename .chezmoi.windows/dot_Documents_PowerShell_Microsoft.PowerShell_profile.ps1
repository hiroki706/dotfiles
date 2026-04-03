# PowerShell Profile
# This file is automatically managed by chezmoi

# Activate mise if available
if (Get-Command mise -ErrorAction SilentlyContinue) {
    & mise activate pwsh | Invoke-Expression
}

# Starship prompt
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

# Aliases
function lg { lazygit @args }
function mr { mise r @args }

# Yazi integration
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi --cwd-file $tmp @args
    $cwd = Get-Content $tmp
    Remove-Item $tmp -Force
    if ($cwd -ne $PWD) {
        Set-Location $cwd
    }
}
