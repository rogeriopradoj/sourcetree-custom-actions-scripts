@echo off
setlocal EnableDelayedExpansion

for /f "tokens=*" %%a in ('git symbolic-ref --short HEAD') do set "BRANCH=%%a"

for /f "tokens=*" %%r in ('git remote') do (
    if "%%r"=="origin" (
        echo ^>^>^>^>^> git push %%r !BRANCH!
        git push %%r !BRANCH!
    )
)

endlocal
