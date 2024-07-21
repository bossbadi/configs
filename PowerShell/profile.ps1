# keyboard shortcut to edit command in editor before running
$env:EDITOR = '"C:\Program Files\Git\usr\bin\vim.exe"'

Set-PSReadLineKeyHandler -Chord 'ctrl+x,ctrl+e' -ScriptBlock {
  # change as you like 
  $editor = if ($env:EDITOR) { $env:EDITOR }
  else { 'notepad' }
  $line = $cursor = $proc = $null
  $editorArgs = @( '-c', '"set syntax=ps1"' )
  try {
    $tmpf = New-TemporaryFile
    # Get current content
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref] $line, [ref] $cursor)
    # If (n)vim, start at last line
    if ($editor -match 'vim') {
      $editorArgs += '+'
    }
    $line > $tmpf.FullName
    $editorArgs += $tmpf.FullName
    # Need to wait for editor to be closed
    $proc = Start-Process $editor -NoNewWindow -PassThru -ArgumentList $editorArgs
    $proc.WaitForExit()
    $proc = $null
    # Clean prompt
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    $content = (Get-Content -Path $tmpf.FullName -Raw -Encoding UTF8).Replace("`r","").Trim()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($content)

    # Feel like running right away? Uncomment
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
  } finally {
    $proc = $null
    Remove-Item -Force $tmpf.FullName
  }
}

# eza
Set-Alias ls eza
function ll { eza -l }
function la { eza -la }
function l { eza -F }

# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
