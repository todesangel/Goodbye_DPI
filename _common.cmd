@echo off
:: _common.cmd - общие настройки для всех скриптов
set _arch=x86
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set _arch=x86_64
if defined PROCESSOR_ARCHITEW6432 set _arch=x86_64
set GOODBYEDPI="%~dp0\%_arch%\goodbyedpi.exe"