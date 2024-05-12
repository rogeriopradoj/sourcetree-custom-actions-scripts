@echo off
setlocal EnableDelayedExpansion

for /f "tokens=*" %%a in ('git symbolic-ref --short HEAD') do set "BRANCH=%%a"

git checkout master 
git merge !BRANCH! --no-ff --no-edit 
git branch -d !BRANCH!

endlocal
