@echo off
setlocal EnableDelayedExpansion

:: Buscar alterações de todos os remotos
for /f "tokens=*" %%a in ('git remote') do (
    echo Fetching from remote: %%a
    git fetch %%a
)

:: Excluir todos os branches remotos, exceto master e main
for /f "tokens=*" %%a in ('git remote') do (
    for /f "tokens=*" %%b in ('git for-each-ref --format="%%(refname:lstrip=3)" refs/remotes/%%a/') do (
        set "branch=%%b"
        if not "!branch!"=="master" if not "!branch!"=="main" if not "!branch!"=="HEAD" (
            echo Deleting remote branch: !branch! from remote %%a
            git push %%a --delete !branch! 2>nul
        )
    )
)

endlocal
