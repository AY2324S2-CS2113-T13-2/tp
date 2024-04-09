@echo off
setlocal enableextensions
pushd %~dp0

cd ..
call gradlew clean shadowJar

cd build\libs
for /f "tokens=*" %%a in (
    'dir /b *.jar'
) do (
    set jarloc=%%a
)

java -jar %jarloc% < ..\..\text-ui-test\input.txt > ..\..\text-ui-test\ACTUAL.TXT

cd ..\..\text-ui-test

:: PowerShell commands to trim trailing spaces
powershell -Command "(Get-Content -Path EXPECTED.TXT) | ForEach-Object { $_.TrimEnd() } | Set-Content -Path EXPECTED.TXT"
powershell -Command "(Get-Content -Path ACTUAL.TXT) | ForEach-Object { $_.TrimEnd() } | Set-Content -Path ACTUAL.TXT"

FC ACTUAL.TXT EXPECTED.TXT >NUL && ECHO Test passed! || Echo Test failed!
