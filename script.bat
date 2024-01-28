@echo off

set fileUsername=
set passwrd=123

:parameters
	if /I %~1 == -file SET fileUsername=%2& SHIFT
	if /I %~1 == -pswd SET passwrd=%2& SHIFT
	if /I %~1 == -help goto help shift
	SHIFT

if not (%1)==() goto parameters


FOR /F "tokens=*" %%i IN (%fileUsername%) DO call :vytvoreni %%i %passwrd%

:vytvoreni
net localgroup %3 /add
net user %4 %1 /fullname:"%1 %2" %3 /add

FOR /F "tokens=*" %%i IN (%fileUsername%) DO call :pridani %%I

:pridani
net localgroup %1 %3 /add

goto END

:help
echo help:
echo -file --cesta k souboru s uzivatelskyma jmenama
echo -pswd --heslo k uctu

:END
