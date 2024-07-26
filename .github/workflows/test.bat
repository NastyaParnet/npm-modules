@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for %%A in (name.txt) do (
    if %%~zA equ 0 (
        echo Error: name.txt is empty.
        exit /b 1
    )
)

FOR /F %%A IN (name.txt) DO SET "PACKAGE_NAME=%%A"

cmd /c npm init -y
cmd /c npm install %PACKAGE_NAME% --save 

IF %ERRORLEVEL% NEQ 0 (
    echo Error: npm install failed.
    exit /b 1
)




for /f "delims=" %%B in ('node test.js "%PACKAGE_NAME%"') do (
    set "LINE=%%B"
    set "ACTUAL_OUTPUT=!ACTUAL_OUTPUT!!LINE!\n"
)
SET "EXPECTED_OUTPUT=Score: 91, ECTS Grade: A"
echo %ACTUAL_OUTPUT% | findstr /C:"%EXPECTED_OUTPUT%" >nul
if %errorlevel% equ 0 (
    echo "Score: 91, ECTS Grade: A" was found
) else (
    echo Error: 
    echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT%
    echo Score: 91, ECTS Grade: A was not found
    exit /b 1
)

SET "EXPECTED_OUTPUT=Score: 80, ECTS Grade: C"
echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT% | findstr /C:"%EXPECTED_OUTPUT%" >nul
if %errorlevel% equ 0 (
    echo "Score: 80, ECTS Grade: C" was found
) else (
    echo Error: 
    echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT%
    echo Score: 80, ECTS Grade: C was not found
    exit /b 1
)

SET "EXPECTED_OUTPUT=Score: 70, ECTS Grade: D"
echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT% | findstr /C:"%EXPECTED_OUTPUT%" >nul
if %errorlevel% equ 0 (
    echo "Score: 70, ECTS Grade: D" was found
) else (
    echo Error: 
    echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT%
    echo Score: 70, ECTS Grade: D was not found
    exit /b 1
)

SET "EXPECTED_OUTPUT=Score: 60, ECTS Grade: E"
echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT% | findstr /C:"%EXPECTED_OUTPUT%" >nul
if %errorlevel% equ 0 (
    echo "Score: 60, ECTS Grade: E" was found
) else (
    echo Error: 
    echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT%
    echo Score: 60, ECTS Grade: E was not found
    exit /b 1
)

SET "EXPECTED_OUTPUT=Score: 45, ECTS Grade: F"
echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT% | findstr /C:"%EXPECTED_OUTPUT%" >nul
if %errorlevel% equ 0 (
    echo "Score: 45, ECTS Grade: F" was found
) else (
    echo Error: 
    echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT%
    echo Score: 45, ECTS Grade: F was not found
    exit /b 1
)

SET "EXPECTED_OUTPUT=Score: 30, ECTS Grade: F"
echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT% | findstr /C:"%EXPECTED_OUTPUT%" >nul
if %errorlevel% equ 0 (
    echo "Score: 30, ECTS Grade: F" was found
) else (
    echo Error: 
    echo ACTUAL_OUTPUT: %ACTUAL_OUTPUT%
    echo Score: 30, ECTS Grade: F was not found
    exit /b 1
)

echo All tests are passed. Try to push it now!