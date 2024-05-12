@echo off

set "feature=%~1"
if "%feature%"=="" (
    echo.
    echo ...ERROR: You must inform the feature name. Ex.:
    echo.
    echo       %0 "new-module-xyz"
    exit /b 1
)

git checkout -b %feature%
