@echo off
echo Installing dotfiles...

:: WezTerm
if not exist "%USERPROFILE%\.config\wezterm" mkdir "%USERPROFILE%\.config\wezterm"
mklink "%USERPROFILE%\.config\wezterm\wezterm.lua" "%USERPROFILE%\dotfiles\.config\wezterm\wezterm.lua"

:: Oh My Posh theme
if not exist "%USERPROFILE%\.config\oh-my-posh" mkdir "%USERPROFILE%\.config\oh-my-posh"
mklink "%USERPROFILE%\.config\oh-my-posh\theme.omp.json" "%USERPROFILE%\dotfiles\.config\oh-my-posh\theme.omp.json"

:: Clink
if not exist "%LOCALAPPDATA%\clink" mkdir "%LOCALAPPDATA%\clink"
mklink "%LOCALAPPDATA%\clink\oh-my-posh.lua" "%USERPROFILE%\dotfiles\clink\oh-my-posh.lua"

echo Done! Restart your terminal.