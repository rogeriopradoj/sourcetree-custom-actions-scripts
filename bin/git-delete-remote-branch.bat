@echo off
setlocal EnableDelayedExpansion

set "branch=%~1"
set "remote=%~2"

if "%branch%"=="" (
    echo.
    echo ...ERROR: You must inform the branch name. Ex.:
    echo.
    echo       %0 "branch-to-be-deleted" [remote-name]
    exit /b 1
)

if not "%remote%"=="" (
    echo ^>^>^>^>^> git branch -d -r %remote%/%branch%
    git branch -d -r %remote%/%branch%
    echo ^>^>^>^>^> git push %remote% :%branch%
    git push %remote% :%branch%
) else (
    for /f "tokens=*" %%r in ('git remote') do (
        echo ^>^>^>^>^> git branch -d -r %%r/%branch%
        git branch -d -r %%r/%branch%
        echo ^>^>^>^>^> git push %%r :%branch%
        git push %%r :%branch%
    )    
)

endlocal
