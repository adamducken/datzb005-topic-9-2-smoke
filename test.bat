@echo off
setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul
set "work=%TEMP%\DatZB005 9.2 %RANDOM%-%RANDOM%"
mkdir "%work%" || exit /b 1
copy /y "%~dp0AD.bat" "%work%\AD.bat" >nul || exit /b 1
copy /y "%~dp0rekinat.bat" "%work%\rekinat.bat" >nul || exit /b 1
pushd "%work%" || exit /b 1

call rekinat.bat 123 >output.txt 2>&1 || goto fail
for %%L in ("1. cipars=1" "2. cipars=2" "3. cipars=3" "Summa=6" "Reizinajums=6") do findstr /l /x /c:%%L rezultats.txt >nul || goto fail
findstr /l /c:"ATTRIB" rezultats.txt >nul || goto fail
for %%F in (rezultats.txt) do set "attributes=%%~aF"
if "!attributes:h=!"=="!attributes!" goto fail

>Adam_Ducken.txt echo old result
(echo Adam*& echo Ducken& echo Adam& echo Ducken& echo 99& echo 1000& echo abc& echo 012& echo 123& echo y& echo 109& echo n)>input.txt
call AD.bat <input.txt >output.txt 2>&1 || goto fail
for %%L in ("1. cipars=1" "2. cipars=0" "3. cipars=9" "Summa=10" "Reizinajums=0") do findstr /l /x /c:%%L Adam_Ducken.txt >nul || goto fail
>author.txt echo Praktisko darbu izpildīja Adam Ducken;
findstr /l /x /g:author.txt Adam_Ducken.txt >nul || goto fail
findstr /l /c:"Nederigs skaitlis." output.txt >nul || goto fail
findstr /l /c:"ATTRIB" Adam_Ducken.txt >nul || goto fail
findstr /l /c:"old result" Adam_Ducken.txt >nul && goto fail
if exist rezultats.txt goto fail
for %%F in (Adam_Ducken.txt) do set "attributes=%%~aF"
if not "!attributes:h=!"=="!attributes!" goto fail

echo PASS
popd
rmdir /s /q "%work%"
exit /b 0

:fail
if exist input.txt type input.txt
if exist output.txt type output.txt
if exist rezultats.txt type rezultats.txt
if exist Adam_Ducken.txt type Adam_Ducken.txt
echo FAIL: %work%
popd
exit /b 1
