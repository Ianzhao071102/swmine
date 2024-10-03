@echo off
SETLOCAL

REM Define Clash installation path
SET CLASH_PATH=C:\clash

REM Define the Base64 encoded configuration file URL
SET BASE64_CONFIG_URL=aHR0cDovMTExLjIzMS4xOTIuMjE0OjU5OTkvaW5zdGFsbC92MS9jbGllbnQvc3Vic2NyaWJlP3Rva2VuPTYwNmVlNjE1MmE1NGJmMjg2Nzc4ZGNmYTE1M2JlNTg=

REM Create the directory if it doesn't exist
IF NOT EXIST "%CLASH_PATH%" (
    mkdir "%CLASH_PATH%"
)

REM Change to the Clash directory
cd "%CLASH_PATH%"

REM Check if Clash is already downloaded
IF NOT EXIST "clash.exe" (
    REM Download Clash (latest version)
    curl -L -o clash-windows-amd64.zip https://github.com/Dreamacro/clash/releases/latest/download/clash-windows-amd64.zip

    REM Extract the downloaded zip file
    tar -xf clash-windows-amd64.zip --strip-components=1
)

REM Decode the Base64 URL
FOR /F "delims=" %%i IN ('powershell -command "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%BASE64_CONFIG_URL%'))"') DO SET CONFIG_URL=%%i

REM Download the configuration file
curl -L -o config.yaml "%CONFIG_URL%"

REM Run Clash
start clash.exe -f config.yaml

ENDLOCAL
