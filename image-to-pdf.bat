@echo off
setlocal

echo ===== Image to PDF Converter =====
echo.

REM ================================
REM User-configurable variables
REM ================================

REM Path to ImageMagick (magick.exe).
REM Leave empty ("") if magick.exe is already in PATH.
set "MAGICK_PATH="

REM Suffix added to output PDF files (before the .pdf extension).
REM Example: "-converted" -> "photo-converted.pdf"
set "OUTPUT_SUFFIX="

REM PDF resolution in DPI (Dots Per Inch).
REM Common values: 72, 150, 300 (print quality), 600 (high print quality).
set "PDF_DPI=600"

REM Colorspace for output.
REM Options: sRGB, RGB, CMYK, Gray, etc.
set "PDF_COLORSPACE=sRGB"

REM Show logs window after conversion?
REM 0 = close immediately
REM 1 = keep window open (pause at the end, useful for debugging)
set "SHOW_LOGS=0"

REM ================================
REM Script logic starts below
REM ================================

REM --- Find ImageMagick if not defined above ---
if not defined MAGICK_PATH (
  for %%I in (magick.exe) do set "MAGICK_PATH=%%~$PATH:I"
  if not defined MAGICK_PATH (
    if exist "C:\Program Files\ImageMagick-7.1.1-Q16\magick.exe" set "MAGICK_PATH=C:\Program Files\ImageMagick-7.1.1-Q16\magick.exe"
    if exist "C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" set "MAGICK_PATH=C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe"
  )
)

if not defined MAGICK_PATH (
  echo ERROR: magick.exe not found.
  echo Please install ImageMagick and make sure it is in PATH.
  echo.
  if %SHOW_LOGS%==1 pause
  exit /b 1
)

echo Using ImageMagick: %MAGICK_PATH%
echo.

REM --- Check if any files were passed ---
if "%~1"=="" (
  echo ERROR: No files passed.
  echo.
  if %SHOW_LOGS%==1 pause
  exit /b 2
)

REM --- Process each file ---
for %%F in (%*) do (
  set "INFILE=%%~fF"
  set "OUTFILE=%%~dpnF%OUTPUT_SUFFIX%.pdf"
  call :Convert
)

echo ===== Done =====
if %SHOW_LOGS%==1 pause
exit /b 0

:Convert
echo Converting: %INFILE%
echo Output:     %OUTFILE%
"%MAGICK_PATH%" "%INFILE%" -units PixelsPerInch -density %PDF_DPI% -colorspace %PDF_COLORSPACE% "%OUTFILE%"
if errorlevel 1 (
  echo [ERROR] Failed to convert %INFILE%
) else (
  echo [OK] Created %OUTFILE%
)
echo.
goto :eof
