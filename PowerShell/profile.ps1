# eza
Set-Alias ls eza
function ll { eza -l }
function la { eza -la }
function l { eza -F }

# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
