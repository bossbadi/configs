@echo off

set message=%*
if "%message%"=="" set message=sync files

if exist "%ProgramFiles%\Git\bin\git.exe" (
    set gitpath=%ProgramFiles%\Git\bin\git.exe
) else (
    set gitpath=\bin\git
)

call "%gitpath%" pull
call "%gitpath%" add .
call "%gitpath%" commit -m "%message%"
call "%gitpath%" push
pause
