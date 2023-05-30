@echo off
setlocal enabledelayedexpansion

set "rootDirectory=C:\YOUR\PATH"
set "emptyFolderCount=0"

echo Checking for empty folders in %rootDirectory%...

rem Iterate over all subdirectories in the root directory
for /r "%rootDirectory%" /d %%d in (*) do (
    rem Check if the current directory is empty
    dir /a /b "%%d\*" >nul 2>&1
    if not errorlevel 1 (
        rem Directory is not empty, skip to the next iteration
        echo Skipping non-empty folder: "%%d"
    ) else (
        rem Directory is empty, delete it
        echo Deleting empty folder: "%%d"
        rd "%%d"
        set /a emptyFolderCount+=1
    )
)

echo Total empty folders deleted: %emptyFolderCount%

pause
endlocal
