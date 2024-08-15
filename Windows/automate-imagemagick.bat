@echo off
setlocal enabledelayedexpansion
REM AUTMATION FOR COMMAND LINE IMAGEMAGICK
REM Description: Script for automatically cropping every photo in a directory
REM Author: Frankie Cook github/frankiecook
REM Date: August 15, 2024

REM enabledelayedexpansion 
REM working with variable counter that changes dynamically
REM allows modification and access of variables within scopes where traditional '%' would not work 

REM Variabls
REM Had major troubles figuring out information about program windows 
REM Mostly solved with the information AutoIt provides, specifically Au3Info.exe
set DIRECTORY=C:\Users\nfcoo\Desktop\
set OUT_FOLDER=Output
set OUT_FILE=Pokemon-GD-
set FILE_EXT=.png
set /A count=25

REM set active drive, set destination
rem c:\
cd C:\Users\nfcoo\Desktop\goldshots\
if not exist "C:\Users\nfcoo\Desktop\goldshots\%OUT_FOLDER%" mkdir %OUT_FOLDER%

REM loop through each file in current directory | for %%f in (directory\path\*) do ( something_here )
for %%f in (.\*) do (
	REM @echo %%f
	set /A count+=1
	set /A number=!count!
	
	rem leading 0s, three places
	:: Add leading zeros
	if !number! LSS 10 (
		set formatted="00!number!"
	) else if !number! LSS 100 (
		set formatted="0!number!"
	) else (
		set formatted="!number!"
	)
	echo !formatted!
	
	REM extract file extension from name
	set filename=%OUT_FILE%!formatted!%FILE_EXT%
	
	REM Image Magick Crop
	magick convert %%f -gravity West -crop 270x243+0-116 %OUT_FOLDER%\!filename!
)

REM don't close / debugging
endlocal
pause