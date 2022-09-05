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
	echo services=false >> config.ini
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
		if %%a==services set ST=%%b
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
	echo Service Terminate : %ST%
	echo.
	pause
	cls
	
:P0
if %TF%==true goto :TFP
if %TF%==false goto :P1
:P1
if %ST%==true goto :STP
if %ST%==false goto :END

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
	cd /D %temp%
	for /d %%D in (*) do rd /s /q "%%D"
	del /f /q * >> %~dp0/logs.txt
	cd %~dp0
	echo Cleaning %windir%\prefetch in progress.
	echo [%TIME%] - Attempting to erase: %windir%\prefetch >> logs.txt
	del /f /s /q %windir%\prefetch\*.* >> logs.txt
	echo Cleaning (%systemdrive%) in progress.
	echo [%TIME%] - Attempting to clean: %systemdrive% >> logs.txt
	if exist "%systemdrive%\recycled" (del /f /s /q %systemdrive%\recycled\*.*  >> logs.txt)
	echo Cleaning (%userprofile%) in progress.
	echo [%TIME%] - Attempting to clean: %userprofile% >> logs.txt
	del /f /q %userprofile%\cookies\*.* >> logs.txt
	del /f /q %userprofile%\recent\*.* >> logs.txt
	del /f /s /q %userprofile%\Local Settings\Temporary Internet Files\*.* >> logs.txt
	del /f /s /q %userprofile%\Local Settings\Temp\*.* >> logs.txt
	del /f /s /q %userprofile%\recent\*.* >> logs.txt
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
	echo Cleaned up Junk Files.
	timeout /t 2 /nobreak > nul
	pause
	goto P1
:STP
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
	echo Stopping excess windows services.
	echo [%TIME%] - Attempting to stop excess windows services. >> logs.txt
	net stop gupdate >> logs.txt
	net stop gupdatem >> logs.txt
	net stop gusvc >> logs.txt
	net stop LavasoftAdAwareService11 >> logs.txt
	net stop SCardSvr >> logs.txt
	net stop NAUpdate >> logs.txt
	net stop AdobeARMservice >> logs.txt
	net stop CscService >> logs.txt
	net stop afcdpsrv >> logs.txt
	net stop AcrSch2Svc >> logs.txt
	net stop syncagentsrv >> logs.txt
	net stop BDESVC >> logs.txt
	net stop bthserv >> logs.txt
	net stop AnyDesk >> logs.txt
	net stop Browser >> logs.txt
	net stop DPS >> logs.txt
	net stop TrkWks >> logs.txt
	net stop iphlpsvc >> logs.txt
	net stop SharedAccess >> logs.txt
	net stop PcaSvc >> logs.txt
	net stop Spooler >> logs.txt
	net stop WPCSvc >> logs.txt
	net stop RemoteRegistry >> logs.txt
	net stop seclogon >> logs.txt
	net stop lmhosts >> logs.txt
	net stop WerSvc >> logs.txt
	net stop stisvc >> logs.txt
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
	echo Stopped excess windows services. 
	timeout /t 2 /nobreak > nul
	pause
:END
cd %~dp0
echo [%TIME%] - Finished cleanup tasks.>> logs.txt 
exit
