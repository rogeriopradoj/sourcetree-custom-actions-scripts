@echo off
setlocal EnableDelayedExpansion
for /f "tokens=*" %%a in ('git symbolic-ref --short HEAD') do set "CURRENT_BRANCH=%%a"

for /f "delims=" %%b in ('git for-each-ref --format="%%(refname:lstrip=2)" refs/heads/') do (
    set "BRANCH=%%b"
    if not "!BRANCH!"=="master" if not "!BRANCH!"=="main" if not "!BRANCH!"=="!CURRENT_BRANCH!" (
        echo ^>^>^>^> git branch -D !BRANCH!
        git branch -D !BRANCH!
    )
)

endlocal
