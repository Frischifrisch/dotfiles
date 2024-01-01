# "C:\Users\chris\Documents\PowerShell\profile.ps1"
# "C:\Users\chris\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
###############################################################################
###############################################################################
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/kushal.omp.json' | Invoke-Expression
###############################################################################
# Set-Alias -Name ci -Value 'code-insiders'
# Set-Alias -Name bg -Value 'c:\platform-tools\Bginfo64.exe'
# Set-Alias -Name st -Value 'C:\Users\chris\speedtest.exe'
# Set-Alias -Name a2 -Value 'aria2c'
# Set-Alias -Name yt -Value 'yt-dlp'
###############################################################################
## Add argument completer for the dotnet CLI tool
$scriptblock = {
  param($wordToComplete, $commandAst, $cursorPosition)
  dotnet complete --position $cursorPosition $commandAst.ToString() |
    ForEach-Object {
      [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock $scriptblock
###############################################################################
# Set-PSReadLineOption -BellStyle Audible -DingTone 1221 -DingDuration 60
# $PSReadLineOptions = @{
#   EditMode                      = 'Windows'
#   HistoryNoDuplicates           = $true
#   HistorySearchCursorMovesToEnd = $true
#   Colors                        = @{
#     'Command' = '#8181f7'
#   }
# }
# Set-PSReadLineOption @PSReadLineOptions
###############################################################################
# $ScriptBlock = {
#   Param([string]$line)

#   if ($line -match '^git') {
#     return $false
#   }
#   else {
#     return $true
#   }
# }
# Set-PSReadLineOption -AddToHistoryHandler $ScriptBlock
###############################################################################
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }
###############################################################################
# thefuck
# $env:PYTHONIOENCODING = 'utf-8'
# Invoke-Expression "$(thefuck --alias --enable-experimental-instant-mode)"
###############################################################################
# Set-PSReadLineOption -PredictionViewStyle ListView
###############################################################################

# C:\Users\chris\SamplePSReadLineProfile.ps1 | Invoke-Expression

# Set-PSReadLineOption -ViModeIndicator 2 -ExtraPromptLineCount 4 | Invoke-Expression

# function lsdc { lsd -ahl --group-directories-first --header --git --icon-theme unicode --versionsort }
# if ($env:TERM_PROGRAM -eq "vscode") { . "$(code --locate-shell-integration-path pwsh)" }































###
# oh-my-posh init pwsh --config 'C:\Users\chris\scoop\apps\oh-my-posh\current\themes\powerlevel10k_rainbow.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\chris\scoop\apps\oh-my-posh\current\themes\tokyo.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\chris\scoop\apps\oh-my-posh\current\themes\gmay.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\chris\scoop\apps\oh-my-posh\current\themes\night-owl.omp.json' | Invoke-Expression
###
Set-Alias -Name 'ci' -Value 'code-insiders'
Set-Alias -Name 'bg' -Value 'Bginfo64'
Set-Alias -Name 'st' -Value 'C:\Users\chris\speedtest.exe'
Set-Alias -Name 'a2' -Value 'aria2c'
Set-Alias -Name 'yt' -Value 'yt-dlp'
Set-Alias -Name 'py' -Value 'python'
set-alias -Name 'python3' -Value 'py'
Set-Alias -Name 'mplayer' -Value 'mpv'
Set-Alias -Name 'far' -Value 'C:\Program Files\Far Manager\Far.exe'
# set-alias -name 'l' -value 'lsd -l'
# set-alias -name 'la' -value 'lsd -a'
# set-alias -name 'lla' -value 'lsd -la'
# set-alias -name 'lt' -value 'lsd --tree'
###
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
###
function lsdc { lsd --all --color always --icon always --icon-theme unicode --classify --size short --date relative --sort version --group-dirs first --header --git --blocks permission,name,date,git,size --hyperlink auto }
###
Set-PSReadLineOption -PredictionViewStyle ListView
###
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
###
Set-PSReadLineKeyHandler -Key Tab -Function Complete
###
Set-PSReadLineKeyHandler -Chord '"',"'" `
                         -BriefDescription SmartInsertQuote `
                         -LongDescription "Insert paired quotes if not already on a quote" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($line.Length -gt $cursor -and $line[$cursor] -eq $key.KeyChar) {
        # Bewege einfach den Cursor
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
    }
    else {
        # Füge passende Anführungszeichen ein, bewege den Cursor, um zwischen den Anführungszeichen zu sein
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
    }
}
###
Import-Module PSCompletions
##
Install-Module -Name "F7History"
Import-Module -Name "F7History" -ArgumentList @{Key = "F10"; AllKey = "Shift-F10"}
###
Install-GuiCompletion
$GuiCompletionConfig.DoubleBorder = $false
$GuiCompletionConfig.ScrollDisplayDown = $false
# Import-Module GuiCompletion
# psc update *