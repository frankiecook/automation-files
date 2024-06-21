@echo off
rem Turn off echoing of commands in the script

rem Change directory to a specific path
cd C:\Users\nfcoo\Documents\GitHub\frankiefrankie.xyz\public_html

rem Start browser in localhost
start brave --new-window http://localhost:8000/
rem start brave --auto-open-devtools-for-tab

rem Execute php pserver
php -S localhost:8000

