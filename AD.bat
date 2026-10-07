@echo on
setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul <nul
pushd "%~dp0" || exit /b 1

:names
set "first="
set "last="
set /p "first=Ievadiet vardu: "
set /p "last=Ievadiet uzvardu: "
if not defined first goto fail
if not defined last goto fail
set "filename=!first!_!last!.txt"
set "safe=!filename:"=!"
if not "!safe!"=="!filename!" goto bad_name
set "safe="
for /f "eol=: delims=\/:*?<>|" %%C in ("!filename!") do set "safe=%%C"
if not "!safe!"=="!filename!" goto bad_name

:number
set "number="
set /p "number=Ievadiet trisciparu skaitli (100-999): "
if not defined number goto fail
if "!number:~2,1!"=="" goto bad_number
if not "!number:~3,1!"=="" goto bad_number
if "!number:~0,1!"=="0" goto bad_number
set "invalid=!number!"
for %%D in (0 1 2 3 4 5 6 7 8 9) do if defined invalid set "invalid=!invalid:%%D=!"
if defined invalid goto bad_number
call "rekinat.bat" "!number!" <nul
if errorlevel 1 goto fail

:repeat
set "again="
set /p "again=Vai atkartot (y/n)? "
if not defined again goto fail
if /i "!again!"=="y" goto number
if /i "!again!"=="n" goto finish
echo Ievadiet y vai n.
goto repeat

:finish
>>rezultats.txt echo Praktisko darbu izpildīja !first! !last!;
if errorlevel 1 goto fail
attrib -h rezultats.txt || goto fail
if exist "!filename!" del /q "!filename!"
ren rezultats.txt "!filename!" || goto fail
echo Saglabats: !filename!
popd
exit /b 0

:bad_name
echo Ievadiet vardu un uzvardu bez faila nosaukuma aizliegtajam rakstzimem.
goto names

:bad_number
echo Nederigs skaitlis. Ievadiet 100-999.
goto number

:fail
echo Kluda: neizdevas saglabat rezultatu.
popd
exit /b 1

rem Autors: Adam Ducken.
