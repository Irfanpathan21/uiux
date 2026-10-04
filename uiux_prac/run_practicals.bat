@echo off
setlocal enabledelayedexpansion
title UI/UX Exam Practicals Runner (Practicals 1 to 7)
color 0B

if exist "%~dp0uiux_prac" (
    set "PDIR=%~dp0uiux_prac"
) else (
    set "PDIR=%~dp0"
)

:: Check Node.js and npm availability on this PC
where node >nul 2>&1
if %errorlevel% equ 0 (
    set "HAS_NODE=1"
    for /f "tokens=*" %%v in ('node -v 2^>nul') do set "NODE_VER=%%v"
) else (
    set "HAS_NODE=0"
    set "NODE_VER=Not Installed"
)

:MENU
cls
echo ===============================================================================
echo                     UI/UX EXAM LAB PRACTICALS (1 TO 7)
echo ===============================================================================
if "%HAS_NODE%"=="1" (
    echo   [System Status] Node.js %NODE_VER% detected - Full CLI and Server support ready
) else (
    echo   [System Status] Node.js not detected - Browser offline standalone mode active
)
echo ===============================================================================
echo.
echo   [1]  Practical 1 - Form Validation using JavaScript
echo   [2]  Practical 2 - Shopping List using AngularJS
echo   [3]  Practical 3 - Simple Calculator using React JS
echo   [4]  Practical 4 - NodeJS Static Server without Express (Starts Server)
echo   [5]  Practical 5 - Counter using React JS
echo   [6]  Practical 6 - Simple Login Form using React JS
echo   [7]  Practical 7 - Chat Module using HTML, CSS, JavaScript
echo.
echo -------------------------------------------------------------------------------
echo   [I]  Auto-Install All Dependencies (npm install for all practicals)
echo   [V]  Verify All Practical Files
echo   [Q]  Quit / Exit
echo ===============================================================================
echo.
set /p choice="Enter your choice (1-7, I, V, Q): "

if "%choice%"=="1" goto P1
if "%choice%"=="2" goto P2
if "%choice%"=="3" goto P3
if "%choice%"=="4" goto P4
if "%choice%"=="5" goto P5
if "%choice%"=="6" goto P6
if "%choice%"=="7" goto P7
if /i "%choice%"=="I" goto INSTALL_ALL
if /i "%choice%"=="V" goto VERIFY
if /i "%choice%"=="Q" goto EXIT

echo [!] Invalid choice, please try again.
timeout /t 2 >nul
goto MENU

:: -----------------------------------------------------------------------------
:: PRACTICAL 1
:: -----------------------------------------------------------------------------
:P1
cls
echo ===============================================================================
echo [Practical 1] Form Validation using JavaScript
echo ===============================================================================
echo Opening Practical 1 in default browser...
start "" "%PDIR%\Practical_1\index.html"
echo.
echo Press any key to return to menu...
pause >nul
goto MENU

:: -----------------------------------------------------------------------------
:: PRACTICAL 2
:: -----------------------------------------------------------------------------
:P2
cls
echo ===============================================================================
echo [Practical 2] Shopping List using AngularJS
echo ===============================================================================
echo Opening Practical 2 in default browser (using offline bundle / CDN)...
start "" "%PDIR%\Practical_2\index.html"
echo.
echo Press any key to return to menu...
pause >nul
goto MENU

:: -----------------------------------------------------------------------------
:: PRACTICAL 3
:: -----------------------------------------------------------------------------
:P3
cls
echo ===============================================================================
echo [Practical 3] Simple Calculator using React JS
echo ===============================================================================
echo Opening React Calculator in default browser (instant, zero configuration)...
start "" "%PDIR%\Practical_3\index.html"
echo.
if "%HAS_NODE%"=="1" (
    echo [Optional] Run via Vite dev server?
    set /p vchoice="Start Vite dev server with auto-dependency check? (y/n): "
    if /i "!vchoice!"=="y" (
        call :ENSURE_DEPS Practical_3
        start "Practical 3 Vite Server" cmd /k "cd /d "%PDIR%\Practical_3" && npm run dev"
    )
)
echo.
echo Press any key to return to menu...
pause >nul
goto MENU

:: -----------------------------------------------------------------------------
:: PRACTICAL 4
:: -----------------------------------------------------------------------------
:P4
cls
echo ===============================================================================
echo [Practical 4] NodeJS Static Server without Express
echo ===============================================================================
if "%HAS_NODE%"=="0" (
    echo [!] Node.js is not installed on this PC.
    echo Practical 4 requires Node.js runtime to execute server.js.
    echo Opening static HTML directly in browser instead...
    start "" "%PDIR%\Practical_4\index.html"
    echo.
    echo To run the backend server, install Node.js from https://nodejs.org/
    pause
    goto MENU
)

:: Ensure dependencies if applicable
if exist "%PDIR%\Practical_4\package.json" (
    if not exist "%PDIR%\Practical_4\node_modules" (
        call :ENSURE_DEPS Practical_4
    )
)

echo Starting Node.js server in a background window...
start "Practical 4 Node Server" cmd /k "cd /d "%PDIR%\Practical_4" && node server.js"
timeout /t 2 >nul
echo Opening http://localhost:3000 in your browser...
start "" "http://localhost:3000"
echo.
echo Server is running on http://localhost:3000
echo Press any key to return to menu...
pause >nul
goto MENU

:: -----------------------------------------------------------------------------
:: PRACTICAL 5
:: -----------------------------------------------------------------------------
:P5
cls
echo ===============================================================================
echo [Practical 5] Counter using React JS
echo ===============================================================================
echo Opening React Counter in default browser (instant, zero configuration)...
start "" "%PDIR%\Practical_5\index.html"
echo.
if "%HAS_NODE%"=="1" (
    echo [Optional] Run via Vite dev server?
    set /p vchoice="Start Vite dev server with auto-dependency check? (y/n): "
    if /i "!vchoice!"=="y" (
        call :ENSURE_DEPS Practical_5
        start "Practical 5 Vite Server" cmd /k "cd /d "%PDIR%\Practical_5" && npm run dev"
    )
)
echo.
echo Press any key to return to menu...
pause >nul
goto MENU

:: -----------------------------------------------------------------------------
:: PRACTICAL 6
:: -----------------------------------------------------------------------------
:P6
cls
echo ===============================================================================
echo [Practical 6] Simple Login Form using React JS
echo ===============================================================================
echo Opening React Login Form in default browser (instant, zero configuration)...
start "" "%PDIR%\Practical_6\index.html"
echo.
if "%HAS_NODE%"=="1" (
    echo [Optional] Run via Vite dev server?
    set /p vchoice="Start Vite dev server with auto-dependency check? (y/n): "
    if /i "!vchoice!"=="y" (
        call :ENSURE_DEPS Practical_6
        start "Practical 6 Vite Server" cmd /k "cd /d "%PDIR%\Practical_6" && npm run dev"
    )
)
echo.
echo Press any key to return to menu...
pause >nul
goto MENU

:: -----------------------------------------------------------------------------
:: PRACTICAL 7
:: -----------------------------------------------------------------------------
:P7
cls
echo ===============================================================================
echo [Practical 7] Chat Module using HTML, CSS, JavaScript
echo ===============================================================================
echo Opening Chat Module in default browser...
start "" "%PDIR%\Practical_7\index.html"
echo.
echo Press any key to return to menu...
pause >nul
goto MENU

:: -----------------------------------------------------------------------------
:: HELPER: ENSURE DEPENDENCIES ARE INSTALLED
:: -----------------------------------------------------------------------------
:ENSURE_DEPS
set "TARGET_DIR=%~1"
if not exist "%PDIR%\%TARGET_DIR%\node_modules" (
    echo.
    echo [*] Dependencies not found for %TARGET_DIR%.
    echo [*] Automatically installing required dependencies via 'npm install'...
    pushd "%PDIR%\%TARGET_DIR%"
    call npm install
    popd
    echo [*] Dependencies installed successfully for %TARGET_DIR%!
    echo.
)
goto :EOF

:: -----------------------------------------------------------------------------
:: AUTO-INSTALL ALL DEPENDENCIES
:: -----------------------------------------------------------------------------
:INSTALL_ALL
cls
echo ===============================================================================
echo              AUTOMATIC DEPENDENCY INSTALLATION (ALL PRACTICALS)
echo ===============================================================================
if "%HAS_NODE%"=="0" (
    echo [ERROR] Node.js and npm were not found on this computer.
    echo Please install Node.js from https://nodejs.org to use npm install.
    echo Note: Practicals 1, 2, 3, 5, 6, 7 can still run without Node.js in any browser!
    pause
    goto MENU
)

echo Checking and installing dependencies across all practicals...
echo.

echo [1/4] Checking Practical 3 (React Calculator)...
call :ENSURE_DEPS Practical_3

echo [2/4] Checking Practical 4 (Node Static Server)...
call :ENSURE_DEPS Practical_4

echo [3/4] Checking Practical 5 (React Counter)...
call :ENSURE_DEPS Practical_5

echo [4/4] Checking Practical 6 (React Login Form)...
call :ENSURE_DEPS Practical_6

echo ===============================================================================
echo [SUCCESS] All dependencies have been verified and installed!
echo ===============================================================================
pause
goto MENU

:: -----------------------------------------------------------------------------
:: VERIFY FILES
:: -----------------------------------------------------------------------------
:VERIFY
cls
echo ===============================================================================
echo Verifying All 7 Practical Files
echo ===============================================================================
for /L %%i in (1,1,7) do (
    if exist "%PDIR%\Practical_%%i\index.html" (
        echo  [OK] Practical %%i: Ready - Practical_%%i\index.html
    ) else (
        echo  [MISSING] Practical %%i: Missing index.html
    )
)
echo.
echo Verification Complete!
pause >nul
goto MENU

:: -----------------------------------------------------------------------------
:: EXIT
:: -----------------------------------------------------------------------------
:EXIT
cls
echo Exiting UI/UX Practicals Runner. Good luck with your exam!
exit /b
