@ECHO OFF
color 02
setlocal EnableDelayedExpansion


:: Use environment variables to get the correct paths
SET "sysFile=%ProgramFiles%\Riot Vanguard\vkg.sys"
SET "bakFile=%ProgramFiles%\Riot Vanguard\vkg.sys.bak"

:: Check if vkg.sys exists
if exist "!sysFile!" (
    :: If it exists, rename it to vkg.sys.bak
    ren "!sysFile!" vkg.sys.bak
    ECHO vkg has been disabled. Reboot to apply the changes.
    color 4f
) else (
    :: Check if vkg.sys.bak exists
    if exist "!bakFile!" (
        :: If it exists, rename it to vkg.sys
        ren "!bakFile!" vkg.sys
        ECHO vkg has been enabled. Reboot to apply the changes.
        color 2f
    ) else (
        :: If neither file exists, output an error message
        ECHO Error: vkg driver not found.
        color 04
    )
)

endlocal
ECHO Press any key to exit...
PAUSE
