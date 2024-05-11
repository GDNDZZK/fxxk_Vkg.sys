@ECHO OFF
color 02
setlocal EnableDelayedExpansion


:: Use environment variables to get the correct paths
SET "sysFile=%ProgramFiles%\Riot Vanguard\vgk.sys"
SET "bakFile=%ProgramFiles%\Riot Vanguard\vgk.sys.bak"

:: Check if vgk.sys exists
if exist "!sysFile!" (
    :: If it exists, rename it to vgk.sys.bak
    ren "!sysFile!" vgk.sys.bak
    ECHO vgk has been disabled. Reboot to apply the changes.
    color 4f
) else (
    :: Check if vgk.sys.bak exists
    if exist "!bakFile!" (
        :: If it exists, rename it to vgk.sys
        ren "!bakFile!" vgk.sys
        ECHO vgk has been enabled. Reboot to apply the changes.
        color 2f
    ) else (
        :: If neither file exists, output an error message
        ECHO Error: vgk driver not found.
        color 04
    )
)

endlocal
ECHO Press any key to exit...
PAUSE
