@echo off
call _common.cmd
:: Проверка прав администратора
net session >nul 2>&1 || (
    echo Требуются права администратора!
    pause
    exit /b 1
)

echo Установка сервиса GoodbyeDPI...
sc stop "GoodbyeDPI" >nul 2>&1
sc delete "GoodbyeDPI" >nul 2>&1

sc create "GoodbyeDPI" binPath= "%GOODBYEDPI% -9 --blacklist \"%~dp0russia-blacklist.txt\" --blacklist \"%~dp0russia-youtube.txt\"" start= auto
sc description "GoodbyeDPI" "Обход DPI и блокировок Роскомнадзора"
sc start "GoodbyeDPI"

echo Сервис успешно установлен и запущен
pause
