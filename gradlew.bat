@echo off
setlocal
set "GRADLE_VERSION=9.8.2"
set "GRADLE_HOME=%USERPROFILE%\.gradle\hello-world-distributions\gradle-%GRADLE_VERSION%"

if not exist "%GRADLE_HOME%\bin\gradle.bat" (
    echo Downloading Gradle %GRADLE_VERSION% on first run...
    powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0gradle\setup-gradle.ps1"
    if errorlevel 1 exit /b 1
)

call "%GRADLE_HOME%\bin\gradle.bat" %*
exit /b %errorlevel%
