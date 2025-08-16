@echo off
setlocal
for %%E in (.jpg .jpeg .png .tif .tiff) do (
  reg delete "HKCU\Software\Classes\SystemFileAssociations\%%E\shell\image-to-pdf" /f >nul 2>nul
)
echo [OK] Context menu removed.
pause
endlocal
