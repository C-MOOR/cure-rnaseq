# Poster Panel OCR — App Features

## Overview

**Poster Panel OCR** is a browser-based tool for extracting text from scientific research posters using OCR (Optical Character Recognition). It allows users to manually draw panels over poster sections and extracts text from each panel separately.

## Core Features

### 1. Image Upload
- **Drag and drop** poster image onto the upload area
- **Click to upload** via the upload button
- Supports common image formats (JPG, PNG, etc.)
- Automatic filename extraction from uploaded file

### 2. Section-Based Panel Drawing
Users draw colored rectangles (panels) over poster regions and assign each to a section:

| Section | Color | Purpose |
|---------|-------|---------|
| Title | 🔴 Red | Poster title |
| Authors | 🟠 Orange | Author names and affiliations |
| Abstract | 🟢 Teal | Abstract text |
| Introduction | 🟡 Yellow | Background/introduction |
| Methods | 🟢 Green | Methodology |
| Results | 🔵 Blue | Results/findings |
| Discussion | 🟣 Purple | Discussion and conclusions |
| References | ⬛ Gray | Bibliography |
| Other | 🩷 Pink | Any other content |

### 3. Zoom Controls
- **Zoom slider** (10%–400%) in header
- **Plus/Minus buttons** for incremental zoom
- **Ctrl+Scroll** wheel zoom on canvas
- Zoom affects displayed image only; coordinates stay accurate

### 4. Image Upscaling for OCR
- **Upscale slider** (1x–8x, default 4x)
- Higher upscale = better OCR accuracy on small text
- Uses high-quality bicubic interpolation
- Applied during OCR extraction, not display

### 5. Interactive Panel Management
- **Panel list** shows all drawn panels with type labels
- **Change section type** via dropdown for each panel
- **Remove** individual panels with ✕ button
- **Undo** last panel with ↩️ Undo button
- **Clear all** panels with 🗑️ Clear button

### 6. OCR Processing
- Uses **Tesseract.js v5** for OCR
- Processes panels in sequence
- Progress indicator shows status
- Panel coordinates extracted from original image resolution
- Results grouped by section type

### 7. Text Cleanup & Dual Output
Two versions of extracted text available:

**Original**: Raw OCR output
- Basic formatting (line breaks, dashes)
- Preserves original OCR errors

**Cleaned**: Post-processed text
- Fixed word splits (hyphenation)
- Corrected common OCR errors (t↔f substitutions)
- Fixed gene names and FlyBase IDs
- Normalized whitespace
- Preserves section structure

### 8. Download Options
- **📥 Original** button downloads raw OCR text
- **📥 Cleaned** button downloads cleaned text
- Auto-generated filename from uploaded poster name
- Files named: `PosterName.txt` and `PosterName_cleaned.txt`

### 9. Debug Mode
- Press **Ctrl+D** to toggle debug panel
- Shows coordinate calculations during drawing
- Useful for troubleshooting coordinate issues

## Technical Specifications

### Packages Used
| Package | Version | Purpose |
|---------|---------|---------|
| Tesseract.js | v5 | OCR engine |
| Browser | Modern (ES6+) | No server needed |

### Coordinate System
The app uses an **image-space coordinate system**:
- Panel coordinates stored in original image pixels
- Display scaling handled separately
- Zoom level does NOT affect panel accuracy
- Ensures consistent results at any zoom level

### OCR Workflow
```
1. User draws panel → mouse → image-space coordinates
2. Store panel {x1, y1, x2, y2, type}
3. On OCR: scale coordinates to 100/zoom%
4. Extract from original image at scaled coordinates
5. Create upscaled canvas (4x default)
6. Apply bicubic smoothing
7. Run Tesseract OCR
8. Return text
```

## Browser Compatibility

Works in any modern browser:
- ✅ Chrome/Edge (recommended)
- ✅ Firefox
- ✅ Safari
- ⚠️ Internet Explorer (not supported)

## Limitations

- **No server required** — all processing happens in browser
- **Large images** may require more processing time
- **Handwriting** — not suitable for handwritten content
- **Very small text** — may need higher upscale factor
- **Non-English text** — currently configured for English only
