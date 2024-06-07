@echo off
REM AUTMATION FOR APPLICATION STARTUP
REM Description: A little bit of nircmd, autoit, batch, and magic
REM Author: Frankie Cook github/frankiecook
REM Date: May 28, 2024

REM Variabls
REM Had major troubles figuring out information about program windows 
REM Mostly solved with the information AutoIt provides, specifically Au3Info.exe
set URL1=http://www.google.com REM Default website for browser (specify help in locating window)
set URL2=http://www.frankiefrankie.xyz
set vscode_path=C:\Users\nfcoo\AppData\Local\Programs\Microsoft VS Code\Code.exe
set discord_path=C:\Users\nfcoo\AppData\Local\Discord\app-1.0.9147\discord.exe
REM 1920x1080 -> 2560x1080
set /A sw1=1920
set /A sh1=1080
set /A sw2=2560
set /A sh2=1080
REM Min Spotify Size 800x600
set /A spotify_x=sw1+sw2-800
set /A spotify_y=645 REM sh2-600+165?
set /A spotify_w=800
set /A spotify_h=600
REM Discord Pos 3540, 206 Size 940, 1040
set /A discord_x=3540
set /A discord_y=206+100
set /A discord_w=940
set /A discord_h=1040-200
REM VSCode Pos -8, -8 Size 1936, 1056
set /A vscode_x=-8
set /A vscode_y=-8
set /A vscode_w=1936
set /A vscode_h=1056
REM Misc. Browsers
set /A browse1_x=spotify_x-8
set /A browse1_y=206
set /A browse1_w=spotify_w+16
set /A browse1_h=sh2-450
REM Pos 1913, 206 Size 129x, 1047
set /A browse2_x=1913
set /A browse2_y=206
set /A browse2_w=1290
set /A browse2_h=1047
REM Pos 2663, 206 Size 100x, 1047
set /A browse3_x=2663
set /A browse3_y=206
set /A browse3_w=1000
set /A browse3_h=1047

REM Launch the application
start "" spotify
start brave --new-window "%URL1%"
start "" "%discord_path%"
start "" "%vscode_path%"
start brave --new-window "%URL2%"
start brave --new-window ""

REM Wait for the application to start
timeout /t 3 >nul

REM Run nircmd to set size and position of window 
REM Window is selected based on the title (or class, id, handle)
REM Command info https://nircmd.nirsoft.net/win.html
REM Had to use AutoIt to figure out window titles
nircmd win setsize ititle "- Discord" %discord_x% %discord_y% %discord_w% %discord_h%
nircmd win setsize title "Spotify Free" %spotify_x% %spotify_y% %spotify_w% %spotify_h%
nircmd win setsize title "Google - Brave" %browse1_x% %browse1_y% %browse1_w% %browse1_h% REM Change if URL changes
nircmd win setsize ititle "- Visual Studio Code" %vscode_x% %vscode_y% %vscode_w% %vscode_h%
nircmd win setsize title "New Tab - Brave" %browse2_x% %browse2_y% %browse2_w% %browse2_h% REM Change if URL changes
nircmd win setsize title "Frankie Frankie - Brave" %browse3_x% %browse3_y% %browse3_w% %browse3_h% REM Change if URL changes