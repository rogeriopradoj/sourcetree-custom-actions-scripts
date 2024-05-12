@echo off

for /f "tokens=*" %%r in ('git remote') do (
    echo ^>^>^>^>^> git push %%r master
    git push %%r master
)
