@echo off
setlocal

REM --- Get the folder where this installer is located ---
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_PATH=%SCRIPT_DIR%image-to-pdf.bat"

REM Add context menu for JPG, JPEG, PNG, TIF, TIFF
for %%E in (.jpg .jpeg .png .tif .tiff) do (
  reg add "HKCU\Software\Classes\SystemFileAssociations\%%E\shell\image-to-pdf" /ve /t REG_SZ /d "Convert to PDF" /f
  reg add "HKCU\Software\Classes\SystemFileAssociations\%%E\shell\image-to-pdf" /v "Icon" /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\mspaint.exe,0" /f
  reg add "HKCU\Software\Classes\SystemFileAssociations\%%E\shell\image-to-pdf\command" /ve /t REG_EXPAND_SZ /d "\"%SCRIPT_PATH%\" \"%%1\"" /f
)

echo.
echo [OK] Context menu "Convert to PDF" installed for JPG, JPEG, PNG, TIFF.
pause
endlocal
