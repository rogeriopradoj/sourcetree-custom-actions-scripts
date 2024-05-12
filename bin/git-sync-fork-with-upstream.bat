@echo off
setlocal EnableDelayedExpansion

for /f "tokens=*" %%a in ('git remote get-url origin') do set "REMOTE_URL_ORIGIN=%%a"
for /f "tokens=*" %%a in ('git remote get-url upstream') do set "REMOTE_URL_UPSTREAM=%%a"

echo ------------------------------------------
echo Git Branch Management
echo ------------------------------------------
echo.
echo ^>^>^>^>^> Origin repository (fork): !REMOTE_URL_ORIGIN!
echo ^>^>^>^>^> Upstream repository (official): !REMOTE_URL_UPSTREAM!
echo.

git fetch upstream --prune
git branch --set-upstream-to upstream/master master
echo.

for /f "tokens=*" %%a in ('git branch -r ^| findstr /i upstream ^| findstr /v /i master ^| findstr /v /i origin ^| findstr /v /i HEAD') do (
    set "upstreamBranch=%%a"
    echo upstreamBranch: !upstreamBranch!    
    set "branchName=!upstreamBranch:~10!"
    echo branchName: !branchName!
    git branch --track !branchName! !upstreamBranch! 2> nul
    git branch --set-upstream-to !upstreamBranch! !branchName!
)
echo.

git pull --rebase upstream
git push --all origin
echo.

echo ^>^>^>^>^> Origin repository (fork): !REMOTE_URL_ORIGIN!
echo ^>^>^>^>^> Upstream repository (official): !REMOTE_URL_UPSTREAM!
echo.

endlocal
