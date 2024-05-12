@echo off
setlocal EnableDelayedExpansion

set "main_branch=main"

git show-ref --heads !main_branch! > nul 2>&1
if not %errorlevel% == "0" (
    set "main_branch=master"
)

for /f "tokens=*" %%a in ('git symbolic-ref --short HEAD') do set "BRANCH=%%a"

echo Branch: !BRANCH!
echo main_branch: !main_branch!

git checkout !main_branch! 
git merge !BRANCH! --no-ff --no-edit 
git branch -d !BRANCH!

endlocal
