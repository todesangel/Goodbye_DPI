@echo off
echo Обновление черного списка...
set SOURCE_URL=https://p.thenewone.lol/domains-export.txt
set TARGET_FILE=%~dp0russia-blacklist.txt

:: Пробуем разные методы загрузки
(
    curl -fsSL "%SOURCE_URL%" > "%TARGET_FILE%" || (
        powershell -Command "Invoke-WebRequest -Uri '%SOURCE_URL%' -OutFile '%TARGET_FILE%'" || (
            bitsadmin /transfer blacklist "%SOURCE_URL%" "%TARGET_FILE%"
        )
    )
) && (
    echo Черный список успешно обновлен
    type "%TARGET_FILE%" | find /c /v ""
) || (
    echo Ошибка при обновлении черного списка
    exit /b 1
)