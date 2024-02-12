@echo off

set fileUsername=

:parameters
	if /I %~1 == -file SET fileUsername=%2& SHIFT
	if /I %~1 == -help goto help shift
	SHIFT

if not (%1)==() goto parameters


FOR /F "tokens=*" %%i IN (%fileUsername%) DO call :vytvoreni %%i

:vytvoreni
net localgroup %4 /add
net user %1 /fullname:"%1 %2" %3 /add

FOR /F "tokens=*" %%i IN (%fileUsername%) DO call :pridani %%i

:pridani
net localgroup %4 %1 /add

goto END

:help
echo help:
echo -file --cesta k souboru s uzivatelskyma jmenama

:END
