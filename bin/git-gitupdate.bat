@echo off
setlocal EnableDelayedExpansion

where git > nul 2>&1
if %errorlevel% == 0 (
    set "main_branch=main"

    cmd /c "exit /b 0"
    git show-ref -q --heads %main_branch% > nul 2>&1
    if not %errorlevel% == "0" (
        set "main_branch=master"
    )

    echo.
    echo -----------------------------------------
    echo  checkout to main branch
    echo -----------------------------------------
    echo.
    
    git checkout !main_branch! 
    
    echo.
    echo -----------------------------------------
    echo  pull from origin
    echo -----------------------------------------
    echo.

    git pull origin !main_branch!
    
    echo.
    echo -----------------------------------------
    echo  fetch pruning
    echo -----------------------------------------
    echo.

    git fetch -p
    
)

endlocal
