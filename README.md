# ![Windows](https://img.shields.io/badge/Platform-Windows-blue) ![ImageMagick](https://img.shields.io/badge/ImageMagick-7.1.2-brightgreen) image-to-pdf Converter for Windows

Convert image files (JPG, JPEG, PNG, TIFF) to PDF directly from Windows Explorer.  
This tool adds a right-click menu for easy access and supports configurable PDF options.

---

## Features

- Right-click any JPG, JPEG, PNG, or TIFF image to quickly convert it to PDF.  
- Converts multiple selected images at once (creates one PDF per image).  
- Configurable PDF options:  
  - **Suffix**: Add a custom suffix to the output PDF filename.  
  - **Resolution (DPI)**: Adjustable for screen or print quality (default: 600).  
  - **Colorspace**: sRGB by default; can be changed to CMYK, Gray, etc.  
  - **Show Logs**: Optional mode to display conversion logs before closing.  
- Easy installation/uninstallation of context menu entries.

---

## Requirements

- **Windows 11** (should also work on Windows 10).  
- **ImageMagick 7** installed with DLLs, for example:  
  `ImageMagick-7.1.2-1-Q16-HDRI-x64-dll.exe`  
- Make sure to select **“Add application directory to your system PATH”** during installation.

---

## Files Included

1. `image-to-pdf.bat` – Main conversion script.  
2. `install_context_menu.bat` – Installs context menu entries.  
3. `uninstall_context_menu.bat` – Removes context menu entries.  

---

## Installation

1. Place all scripts in a folder (e.g., `C:\Tools\image-to-pdf\`).  
2. Run `install_context_menu.bat`.  
3. Right-click an image file (JPG, JPEG, PNG, TIFF) → select **“Convert to PDF”**.  
4. The PDF will be generated in the same folder as the source image with the configured suffix.

---

## Configuration

You can adjust settings in `image-to-pdf.bat`:

| Variable         | Description                                                                 | Default |
|-----------------|----------------------------------------------------------------------------|---------|
| `OUTPUT_SUFFIX`  | Text added to the output PDF filename before `.pdf`                         | (empty) |
| `PDF_DPI`        | Resolution in dots per inch for PDF output                                  | 600     |
| `PDF_COLORSPACE` | Color space of the PDF (sRGB, CMYK, Gray, etc.)                             | sRGB    |
| `SHOW_LOGS`      | 0 = close immediately, 1 = keep window open to see logs                     | 0       |

---

## Uninstallation

- To remove the context menu entries, run uninstall_context_menu.bat.
- The main script can remain for manual usage or deletion as desired.

---

## Notes

- This tool uses ImageMagick’s magick.exe to perform conversions (Tested with version 7.1.2).
- Ensure ImageMagick is installed and accessible in PATH.
- For best print quality, use 300–600 DPI. For screen-only PDFs, 72–150 DPI is sufficient.
