@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "number=%~1"
if "!number:~2,1!"=="" goto invalid_number
if not "!number:~3,1!"=="" goto invalid_number
if "!number:~0,1!"=="0" goto invalid_number
set "invalid=!number!"
for %%D in (0 1 2 3 4 5 6 7 8 9) do if defined invalid set "invalid=!invalid:%%D=!"
if defined invalid goto invalid_number

set /a "first=!number:~0,1!, second=!number:~1,1!, third=!number:~2,1!, sum=first+second+third, product=first*second*third" >nul
set "result=%~dp0rezultats.txt"
if exist "!result!" (
    attrib -h "!result!" || exit /b 1
)
>"!result!" (
    echo 1. cipars=!first!
    echo 2. cipars=!second!
    echo 3. cipars=!third!
    echo Summa=!sum!
    echo Reizinajums=!product!
) || exit /b 1
help attrib >>"!result!"
type "!result!" || exit /b 1
attrib +h "!result!"
exit /b !errorlevel!

:invalid_number
echo Nederigs skaitlis. Ievadiet 100-999.
exit /b 1

rem Autors: Adam Ducken.
