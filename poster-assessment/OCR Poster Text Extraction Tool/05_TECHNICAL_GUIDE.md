# Technical Guide — Poster Panel OCR

## Overview

This document describes the technical implementation of the Poster Panel OCR tool, including the coordinate system, OCR processing, and cleanup algorithms.

---

## Architecture

### Client-Side Only
The app runs entirely in the browser:
- **No server required**
- **No backend processing**
- **All data stays local**

### Technology Stack
| Component | Technology | Version |
|-----------|------------|---------|
| OCR Engine | Tesseract.js | v5 |
| Language | JavaScript | ES6+ |
| Styling | CSS3 | - |
| No build step | Pure HTML/JS | - |

---

## Image Coordinate System

### Problem Statement
When drawing panels at one zoom level and then zooming out, panels appeared in wrong positions. This required a robust coordinate system.

### Solution: Image-Space Coordinates
The app stores all panel coordinates in **original image pixels**, regardless of zoom level.

```
Panel Coordinate System:
┌─────────────────────────────────────┐
│ Original Image (e.g., 1600x1221)    │
│                                     │
│  ┌─────────┐                        │
│  │  Panel  │ x1=400, y1=300         │
│  │         │ x2=800, y2=600         │
│  └─────────┘                        │
│                                     │
│  Scale to display: display = zoom%  │
└─────────────────────────────────────┘
```

### Coordinate Flow

| Step | Event | Coordinate Space |
|------|-------|------------------|
| 1 | User clicks mouse | Client coordinates |
| 2 | `getPos()` converts | Image-space → display-space |
| 3 | Panel stored | Image-space (fixed) |
| 4 | `reloadCanvas()` | Image-space → display-space |
| 5 | Panel drawn | Display-space |
| 6 | OCR extracts | Image-space directly |

### Key Functions

#### `getPos(e)`
Converts mouse event to image-space coordinates:

```javascript
function getPos(e) {
    const canvasRect = canvas.getBoundingClientRect();
    const displayX = e.clientX - canvasRect.left;
    const displayY = e.clientY - canvasRect.top;
    
    // Convert display → image space
    const scale = 100 / state.zoom;
    return {
        x: displayX * scale,
        y: displayY * scale
    };
}
```

#### `reloadCanvas()`
Sets canvas to display size and draws image:

```javascript
function reloadCanvas() {
    const scale = state.zoom / 100;
    const displayW = state.image.width * scale;
    const displayH = state.image.height * scale;
    
    // Canvas matches CSS size
    canvas.width = displayW;
    canvas.height = displayH;
    canvas.style.width = displayW + 'px';
    canvas.style.height = displayH + 'px';
    
    // Draw at display resolution
    ctx.drawImage(state.image, 0, 0, displayW, displayH);
    drawAllPanels();
}
```

#### `drawAllPanels()`
Converts image-space panels to display-space for drawing:

```javascript
function drawAllPanels() {
    const scale = state.zoom / 100;
    state.panels.forEach(panel => {
        const dx1 = panel.x1 * scale;
        const dy1 = panel.y1 * scale;
        const dx2 = panel.x2 * scale;
        const dy2 = panel.y2 * scale;
        // Draw at display coordinates...
    });
}
```

---

## OCR Processing

### Tesseract.js Configuration
```javascript
const result = await Tesseract.recognize(dataUrl, 'eng', {
    logger: m => {
        if (m.status === 'recognizing text') {
            status.textContent = `${Math.round(m.progress * 100)}%`;
        }
    }
});
```

### Image Upscaling
Before OCR, images are upscaled using bicubic interpolation:

```javascript
const tempCanvas = document.createElement('canvas');
tempCanvas.width = width * upscaleFactor;  // Default: 4x
tempCanvas.height = height * upscaleFactor;

const tempCtx = tempCanvas.getContext('2d');
tempCtx.imageSmoothingEnabled = true;
tempCtx.imageSmoothingQuality = 'high';

tempCtx.drawImage(state.image, x1, y1, width, height, 0, 0, 
                  tempCanvas.width, tempCanvas.height);
```

### Panel Extraction
1. User draws panel → image-space coordinates
2. On OCR run, scale back to 100% zoom equivalent:
   ```javascript
   const scale = 100 / state.zoom;
   const x1 = panel.x1 * scale;
   const y1 = panel.y1 * scale;
   // ...
   ```
3. Extract region from original image (not displayed canvas)
4. Upscale for OCR
5. Run Tesseract

---

## Text Cleanup Algorithm

### Cleanup Pipeline
```
Raw OCR → Fix Splits → Remove Decorative → Fix Names → 
Fix IDs → Normalize → Preserve References
```

### Key Algorithms

#### Word Split Detection
```python
# Pattern: hyphen at end of word + lowercase start of next word
r'(\w+)-\s*\n\s*(\w+)'
# Replacement: '$1$2'
```

#### Context-Aware t→f Fix
```python
# t followed by digit pattern (time/region notation)
r'\bt(\d)' → 'to$1'

# word t + word pattern (preposition)
r'(\w+)t\s+(\w)' → '$1 to $2'
```

#### FlyBase ID Validation
```python
# Pattern: FBgn followed by 7 digits
r'FBgn(\d{7})'
# Validate each digit, fix OCR artifacts
```

---

## Data Structures

### Panel Object
```javascript
{
    x1: number,    // Left edge (image pixels)
    y1: number,     // Top edge (image pixels)
    x2: number,    // Right edge (image pixels)
    y2: number,     // Bottom edge (image pixels)
    type: string    // Section type: 'introduction', 'methods', etc.
}
```

### State Object
```javascript
{
    image: Image,           // Original poster image
    zoom: number,          // Current zoom (10-400%)
    upscale: number,       // OCR upscale factor (1-8)
    panels: Panel[],        // Array of drawn panels
    originalText: string,  // Raw OCR results
    cleanedText: string,   // Cleaned results
    currentFilename: string
}
```

### Section Color Map
```javascript
const COLORS = {
    title: '#e74c3c',
    authors: '#e67e22',
    abstract: '#1abc9c',
    introduction: '#f1c40f',
    methods: '#2ecc71',
    results: '#3498db',
    discussion: '#9b59b6',
    references: '#34495e',
    other: '#e91e63'
};
```

---

## Performance Considerations

| Operation | Complexity | Notes |
|-----------|-------------|--------|
| Image load | O(n) | Size of image file |
| Panel drawing | O(1) | Simple rect calculation |
| OCR per panel | O(n×upscale²) | n=text chars, upscale=1-8 |
| Text cleanup | O(n) | Linear scan |

### Optimization Tips
- Use higher upscale only for small text
- Process fewer, larger panels rather than many small ones
- Clear unused panels before OCR

---

## Browser Compatibility

### Tested Browsers
| Browser | Version | Status |
|---------|----------|--------|
| Chrome | 90+ | ✅ Full support |
| Firefox | 88+ | ✅ Full support |
| Safari | 14+ | ✅ Full support |
| Edge | 90+ | ✅ Full support |

### Required APIs
- Canvas 2D API
- File API
- Blob/URL.createObjectURL
- ES6 Promises

---

## File Structure

```
poster_panel_define_ocr.html
├── CSS Styles (inline)
├── HTML Layout
│   ├── Header (zoom controls)
│   ├── Control Bar (sections, buttons)
│   ├── Image Area (canvas, upload)
│   └── Sidebar (panels, results, downloads)
└── JavaScript (inline)
    ├── State Management
    ├── Event Handlers
    ├── OCR Processing
    ├── Coordinate System
    └── Cleanup Functions
```

---

## Debug Mode

Toggle with **Ctrl+D**:

Shows in real-time:
- Mouse position (client, display, image)
- Zoom level
- Canvas dimensions
- Coordinate conversions

Useful for troubleshooting:
- Panel positioning
- Zoom accuracy
- Mouse event handling
