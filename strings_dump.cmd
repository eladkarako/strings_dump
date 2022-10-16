@echo off
chcp 65001 1>nul 2>nul

if ["%~1"] EQU [""] ( goto ERROR_NO_ARG     )
if not exist "%~1"  ( goto ERROR_NOT_A_FILE )
if exist %~s1\NUL   ( goto ERROR_NOT_A_FILE )


pushd "%~sdp0"


set "FILE_OUTPUT=%~f1__strings.txt"

echo [INFO] %~nx1 1>&2
echo %~nx1 1>"%FILE_OUTPUT%"

::title %~nx1 (7 BIT strings)
::echo [INFO] dumping strings (7 BIT)... 1>&2
::echo. 1>>"%FILE_OUTPUT%"
::echo. 1>>"%FILE_OUTPUT%"
::echo ------------------------------------------------ [strings: 7 BIT]                         1>>"%FILE_OUTPUT%"  2>nul
::call "strings.exe" "--all" "--radix=x" "--encoding=s"  "%~s1"                  1>>"%FILE_OUTPUT%"  2>nul

title %~nx1 (8 BIT strings)
echo [INFO] dumping strings (8 BIT)... 1>&2
echo. 1>>"%FILE_OUTPUT%"
echo. 1>>"%FILE_OUTPUT%"
echo ------------------------------------------------ [strings: 8 BIT]                         1>>"%FILE_OUTPUT%"  2>nul
call "strings.exe" "--all" "--radix=x" "--encoding=S"  "%~s1"                  1>>"%FILE_OUTPUT%"  2>nul

title %~nx1 (16 BIT - little-endian (LE) strings)
echo [INFO] dumping strings (16 BIT - little-endian (LE))... 1>&2
echo. 1>>"%FILE_OUTPUT%"
echo. 1>>"%FILE_OUTPUT%"
echo ------------------------------------------------ [strings: 16 BIT - little-endian (LE)]   1>>"%FILE_OUTPUT%"  2>nul
call "strings.exe" "--all" "--radix=x" "--encoding=l"  "%~s1"                  1>>"%FILE_OUTPUT%"  2>nul

title %~nx1 (16 BIT - big-endian (BE) strings)
echo [INFO] dumping strings (16 BIT - big-endian (BE))... 1>&2
echo. 1>>"%FILE_OUTPUT%"
echo. 1>>"%FILE_OUTPUT%"
echo ------------------------------------------------ [strings: 16 BIT - big-endian (BE)]      1>>"%FILE_OUTPUT%"  2>nul
call "strings.exe" "--all" "--radix=x" "--encoding=b"  "%~s1"                  1>>"%FILE_OUTPUT%"  2>nul

title %~nx1 (32 BIT - little-endian (LE) strings)
echo [INFO] dumping strings (32 BIT - little-endian (LE))... 1>&2
echo. 1>>"%FILE_OUTPUT%"
echo. 1>>"%FILE_OUTPUT%"
echo ------------------------------------------------ [strings: 32 BIT - little-endian (LE)]   1>>"%FILE_OUTPUT%"  2>nul
call "strings.exe" "--all" "--radix=x" "--encoding=L"  "%~s1"                  1>>"%FILE_OUTPUT%"  2>nul

title %~nx1 (32 BIT - big-endian (BE) strings)
echo [INFO] dumping strings (32 BIT - big-endian (BE))... 1>&2
echo. 1>>"%FILE_OUTPUT%"
echo. 1>>"%FILE_OUTPUT%"
echo ------------------------------------------------ [strings: 32 BIT - big-endian (BE)]      1>>"%FILE_OUTPUT%"  2>nul
call "strings.exe" "--all" "--radix=x" "--encoding=B"  "%~s1"                  1>>"%FILE_OUTPUT%"  2>nul


echo. 1>&2

set "EXIT_CODE=0"
goto END

::-------------------------------------------------------------------

:ERROR_NO_ARG
  set "EXIT_CODE=111"
  echo [ERROR] missing arguments. 1>&2
  goto END

:ERROR_NOT_A_FILE
  set "EXIT_CODE=222"
  echo [ERROR] argument is not a file. 1>&2
  goto END

:END
  popd
  ::pause
  exit /b %EXIT_CODE%
