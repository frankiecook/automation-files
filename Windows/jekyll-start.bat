@echo off
rem Turn off echoing of commands in the script

rem Change directory to a specific path
cd C:\Users\nfcoo\Documents\GitHub\nfcook.github.io

rem Start browser in localhost
start brave http://localhost:4000
rem start brave --auto-open-devtools-for-tab

rem Execute jekyll server
bundle exec jekyll serve --port 4000

rem Failure to load, then check baseurl in _config.yml

