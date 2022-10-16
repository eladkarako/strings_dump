@echo off
chcp 65001 1>nul 2>nul

pushd "%~sdp0"

:LOOP
  if ["%~1"] EQU [""] ( goto END )
  call "strings_dump.cmd" "%~f1"

:NEXT
  shift
  goto LOOP

:END
  ::timeout /t 5 1>&2
  pause
  popd
  exit /b 0
