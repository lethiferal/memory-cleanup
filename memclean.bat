@echo off

rem https://github.com/lethiferal/memcleanup.bat

setlocal enabledelayedexpansion
color 0F
title Memory Cleanup by Lethiferal.
echo  _________________    _______                                      
echo ^|# :           : #^|  ^|   ^|   ^|.-----.--------.-----.----.--.--.    
echo ^|  :           :  ^|  ^|       ^|^|  -__^|        ^|  _  ^|   _^|  ^|  ^|    
echo ^|  :           :  ^|  ^|__^|_^|__^|^|_____^|__^|__^|__^|_____^|__^| ^|___  ^|    
echo ^|  :           :  ^|                                     ^|_____^|    
echo ^|  :___________:  ^|   ______ __                                    
echo ^|     _________   ^|  ^|      ^|  ^|.-----.---.-.-----.--.--.-----.    
echo ^|    ^| __      ^|  ^|  ^|   ---^|  ^|^|  -__^|  _  ^|     ^|  ^|  ^|  _  ^|    
echo ^|    ^|^|  ^|     ^|  ^|  ^|______^|__^|^|_____^|___._^|__^|__^|_____^|   __^|    
echo \____^|^|__^|_____^|__^|                                     ^|__^|   
echo.
echo Please close any active applications and press a key to start storage cleanup.
echo.
pause
if exist "logs.txt" (
	echo. >> logs.txt
	echo --------------------%time%-------------------- >> logs.txt
	echo. >> logs.txt
) else (
	type nul > logs.txt
	echo  _________________    _______                                      >> logs.txt
	echo ^|# :           : #^|  ^|   ^|   ^|.-----.--------.-----.----.--.--.    >> logs.txt
	echo ^|  :-----------:  ^|  ^|       ^|^|  -__^|        ^|  _  ^|   _^|  ^|  ^|    >> logs.txt
	echo ^|  :    log    :  ^|  ^|__^|_^|__^|^|_____^|__^|__^|__^|_____^|__^| ^|___  ^|    >> logs.txt
	echo ^|  :-----------:  ^|                                     ^|_____^|    >> logs.txt
	echo ^|  :___________:  ^|   ______ __                                    >> logs.txt
	echo ^|     _________   ^|  ^|      ^|  ^|.-----.---.-.-----.--.--.-----.    >> logs.txt
	echo ^|    ^| __      ^|  ^|  ^|   ---^|  ^|^|  -__^|  _  ^|     ^|  ^|  ^|  _  ^|    >> logs.txt
	echo ^|    ^|^|  ^|     ^|  ^|  ^|______^|__^|^|_____^|___._^|__^|__^|_____^|   __^|    >> logs.txt
	echo \____^|^|__^|_____^|__^|                                     ^|__^|      >> logs.txt
	echo                    https://github.com/lethiferal/memcleanup.bat >> logs.txt
	echo. >> logs.txt
	echo --------------------%time%-------------------- >> logs.txt
	echo. >> logs.txt
	echo [%TIME%] - Script started. >> logs.txt
)
cls
if exist "config.ini" (goto config_loader) else (goto config_create)
:config_create
	type nul > config.ini
	echo tempfile=false >> config.ini
	echo prefetch=false >> config.ini
	echo  _________________    _______                                      
	echo ^|# :           : #^|  ^|   ^|   ^|.-----.--------.-----.----.--.--.    
	echo ^|  :           :  ^|  ^|       ^|^|  -__^|        ^|  _  ^|   _^|  ^|  ^|    
	echo ^|  :           :  ^|  ^|__^|_^|__^|^|_____^|__^|__^|__^|_____^|__^| ^|___  ^|    
	echo ^|  :           :  ^|                                     ^|_____^|    
	echo ^|  :___________:  ^|   ______ __                                    
	echo ^|     _________   ^|  ^|      ^|  ^|.-----.---.-.-----.--.--.-----.    
	echo ^|    ^| __      ^|  ^|  ^|   ---^|  ^|^|  -__^|  _  ^|     ^|  ^|  ^|  _  ^|    
	echo ^|    ^|^|  ^|     ^|  ^|  ^|______^|__^|^|_____^|___._^|__^|__^|_____^|   __^|    
	echo \____^|^|__^|_____^|__^|                                     ^|__^|   
	echo.
	echo Please update the config.ini file to enable or disable specific cleanup procedures.
	echo.
	pause
	cls
	
:config_loader
	for /f "tokens=1,2 delims==" %%a in (config.ini) do (
		if %%a==tempfile set TF=%%b
		if %%a==prefetch set PF=%%b
	)
	echo  _________________    _______                                      
	echo ^|# :           : #^|  ^|   ^|   ^|.-----.--------.-----.----.--.--.    
	echo ^|  :           :  ^|  ^|       ^|^|  -__^|        ^|  _  ^|   _^|  ^|  ^|    
	echo ^|  :           :  ^|  ^|__^|_^|__^|^|_____^|__^|__^|__^|_____^|__^| ^|___  ^|    
	echo ^|  :           :  ^|                                     ^|_____^|    
	echo ^|  :___________:  ^|   ______ __                                    
	echo ^|     _________   ^|  ^|      ^|  ^|.-----.---.-.-----.--.--.-----.    
	echo ^|    ^| __      ^|  ^|  ^|   ---^|  ^|^|  -__^|  _  ^|     ^|  ^|  ^|  _  ^|    
	echo ^|    ^|^|  ^|     ^|  ^|  ^|______^|__^|^|_____^|___._^|__^|__^|_____^|   __^|    
	echo \____^|^|__^|_____^|__^|                                     ^|__^|   
	echo.
	echo Config file found, displaying settings loaded from a configuration file.
	echo Tempfile Deletion : %TF%
	echo Prefetch Deletion : %PF%
	echo.
	pause
	cls
	
:P0
if %TF%==true goto :TFP
if %TF%==false goto :P1
:P1
if %PF%==true goto :PFP
if %PF%==false goto :END

:TFP
	cls
	echo  _________________    _______                                      
	echo ^|# :           : #^|  ^|   ^|   ^|.-----.--------.-----.----.--.--.    
	echo ^|  :           :  ^|  ^|       ^|^|  -__^|        ^|  _  ^|   _^|  ^|  ^|    
	echo ^|  :           :  ^|  ^|__^|_^|__^|^|_____^|__^|__^|__^|_____^|__^| ^|___  ^|    
	echo ^|  :           :  ^|                                     ^|_____^|    
	echo ^|  :___________:  ^|   ______ __                                    
	echo ^|     _________   ^|  ^|      ^|  ^|.-----.---.-.-----.--.--.-----.    
	echo ^|    ^| __      ^|  ^|  ^|   ---^|  ^|^|  -__^|  _  ^|     ^|  ^|  ^|  _  ^|    
	echo ^|    ^|^|  ^|     ^|  ^|  ^|______^|__^|^|_____^|___._^|__^|__^|_____^|   __^|    
	echo \____^|^|__^|_____^|__^|                                     ^|__^|   
	echo.
	echo Cleaning (%temp%) in progress.
	echo [%TIME%] - Attempting to erase: %temp% >> logs.txt
	dir %temp% >> logs.txt
	cd /D %temp%
	for /d %%D in (*) do rd /s /q "%%D"
	del /f /q *
	cls
	echo  _________________    _______                                      
	echo ^|# :           : #^|  ^|   ^|   ^|.-----.--------.-----.----.--.--.    
	echo ^|  :           :  ^|  ^|       ^|^|  -__^|        ^|  _  ^|   _^|  ^|  ^|    
	echo ^|  :           :  ^|  ^|__^|_^|__^|^|_____^|__^|__^|__^|_____^|__^| ^|___  ^|    
	echo ^|  :           :  ^|                                     ^|_____^|    
	echo ^|  :___________:  ^|   ______ __                                    
	echo ^|     _________   ^|  ^|      ^|  ^|.-----.---.-.-----.--.--.-----.    
	echo ^|    ^| __      ^|  ^|  ^|   ---^|  ^|^|  -__^|  _  ^|     ^|  ^|  ^|  _  ^|    
	echo ^|    ^|^|  ^|     ^|  ^|  ^|______^|__^|^|_____^|___._^|__^|__^|_____^|   __^|    
	echo \____^|^|__^|_____^|__^|                                     ^|__^|   
	echo.
	echo Cleaned up %temp%.
	timeout /t 2 /nobreak > nul
	pause
	goto P1
:PFP
	cls
	echo  _________________    _______                                      
	echo ^|# :           : #^|  ^|   ^|   ^|.-----.--------.-----.----.--.--.    
	echo ^|  :           :  ^|  ^|       ^|^|  -__^|        ^|  _  ^|   _^|  ^|  ^|    
	echo ^|  :           :  ^|  ^|__^|_^|__^|^|_____^|__^|__^|__^|_____^|__^| ^|___  ^|    
	echo ^|  :           :  ^|                                     ^|_____^|    
	echo ^|  :___________:  ^|   ______ __                                    
	echo ^|     _________   ^|  ^|      ^|  ^|.-----.---.-.-----.--.--.-----.    
	echo ^|    ^| __      ^|  ^|  ^|   ---^|  ^|^|  -__^|  _  ^|     ^|  ^|  ^|  _  ^|    
	echo ^|    ^|^|  ^|     ^|  ^|  ^|______^|__^|^|_____^|___._^|__^|__^|_____^|   __^|    
	echo \____^|^|__^|_____^|__^|                                     ^|__^|   
	echo.
	echo Cleaning %windir%\prefetch in progress.
	cd %~dp0
	echo [%TIME%] - Attempting to erase: %windir%\prefetch >> logs.txt
	dir %windir%\prefetch\ >> logs.txt
	del /f /s /q %windir%\prefetch\*.*
	cls
	echo  _________________    _______                                      
	echo ^|# :           : #^|  ^|   ^|   ^|.-----.--------.-----.----.--.--.    
	echo ^|  :           :  ^|  ^|       ^|^|  -__^|        ^|  _  ^|   _^|  ^|  ^|    
	echo ^|  :           :  ^|  ^|__^|_^|__^|^|_____^|__^|__^|__^|_____^|__^| ^|___  ^|    
	echo ^|  :           :  ^|                                     ^|_____^|    
	echo ^|  :___________:  ^|   ______ __                                    
	echo ^|     _________   ^|  ^|      ^|  ^|.-----.---.-.-----.--.--.-----.    
	echo ^|    ^| __      ^|  ^|  ^|   ---^|  ^|^|  -__^|  _  ^|     ^|  ^|  ^|  _  ^|    
	echo ^|    ^|^|  ^|     ^|  ^|  ^|______^|__^|^|_____^|___._^|__^|__^|_____^|   __^|    
	echo \____^|^|__^|_____^|__^|                                     ^|__^|   
	echo.
	echo Cleaned up %windir%\prefetch.
	timeout /t 2 /nobreak > nul
	pause
:END
cd %~dp0
echo [%TIME%] - Finished cleanup tasks.>> logs.txt 
exit

