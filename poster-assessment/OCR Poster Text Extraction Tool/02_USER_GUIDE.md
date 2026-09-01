# Poster Panel OCR — User Guide

## Getting Started

### Prerequisites
- A modern web browser (Chrome, Firefox, Safari, or Edge)
- No installation required — runs entirely in browser
- No internet required after initial page load (for offline use)

### How to Access
1. Open `poster_panel_define_ocr.html` in your web browser
2. The app will load and display the upload area

---

## Step-by-Step Tutorial

### Step 1: Upload Your Poster
1. **Drag and drop** your poster image onto the upload area, OR
2. Click the **📤 Upload Poster** button to select a file

The app will automatically fit the poster to the viewing area.

### Step 2: Select a Section Type
Before drawing, select the section type for your panel:

1. Look at the **section buttons** in the control bar
2. Click the button matching your content type (e.g., "Introduction")
3. The button will highlight with a thicker border

**Section Types:**
| Button | Use For |
|--------|---------|
| Title | Poster title and subtitle |
| Authors | Author names and affiliations |
| Abstract | Abstract text |
| Intro | Introduction/background |
| Methods | Methodology |
| Results | Results and data |
| Discussion | Discussion and conclusions |
| Refs | References/bibliography |
| Other | Anything else |

### Step 3: Draw Panels Over Content
1. **Click and drag** on the poster image to draw a rectangle
2. Release the mouse to complete the panel
3. The panel appears with a colored border matching its section type
4. A number label appears in the top-left corner

**Tips:**
- Draw panels only over text content you want to extract
- Exclude images, graphs, and decorative elements
- You can draw multiple panels for the same section

### Step 4: Adjust Panel Position (if needed)
To change a panel's section type:
1. Find the panel in the **📋 Panels** list (bottom of screen)
2. Use the dropdown to select a different section type
3. The panel color will update automatically

To remove a panel:
- Click the **✕** button next to the panel in the list

### Step 5: Zoom and Pan
**Zoom:**
- Use the **slider** in the header (10%–400%)
- Or click **➕** / **➖** buttons for 25% increments
- Or hold **Ctrl** and scroll your mouse wheel

**Pan:**
- Click and drag with **middle mouse button** to pan around the image
- Useful when zoomed in on large posters

### Step 6: Adjust OCR Quality (Optional)
For posters with small text, increase the upscale factor:

1. Move the **Upscale slider** (1x–8x, default 4x)
2. Higher values = better accuracy on small text
3. Higher values = slower processing

### Step 7: Run OCR
1. Ensure you have drawn at least one panel
2. Click the **🚀 Run OCR** button
3. Wait for processing to complete
4. Results appear in the **📄 Results** section

### Step 8: View and Download Results
**Toggle between versions:**
- Click **Original** to see raw OCR output
- Click **Cleaned** to see corrected text

**Download:**
- Click **📥 Original** to download raw text
- Click **📥 Cleaned** to download cleaned text

Files are automatically named based on your poster's filename.

---

## Tips for Best Results

### Panel Drawing
✅ **DO:**
- Draw panels tightly around text
- Include some margin (1-2%) around text
- Use separate panels for different sections
- Review and correct section assignments

❌ **DON'T:**
- Include images or graphs (will add noise)
- Leave gaps in text coverage
- Draw panels outside visible content area

### OCR Quality
✅ **For best results:**
- Use highest quality image available
- Increase upscale factor for small text
- Ensure good contrast in original image
- Avoid blurry or low-resolution images

### Section Organization
- **One panel per section** = cleaner output
- **Multiple panels per section** = content combined automatically
- Panels processed in **drawing order**
- First panel of each section gets the header

---

## Troubleshooting

### "Panel draws in wrong position"
- Press **Ctrl+D** to show debug info
- Check that `getPos` coordinates match where you clicked
- Ensure you're not zoomed in a different zoom level

### "OCR results are empty or poor quality"
- Try increasing the **Upscale slider** to 6x or 8x
- Ensure the panel covers text clearly
- Check that text has good contrast

### "App runs slowly"
- Reduce upscale factor for faster processing
- Process fewer panels at a time
- Use a smaller image file

### "Can't download results"
- Ensure at least one panel was processed
- Check that results appear in the Results section
- Try a different browser if downloads fail

---

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| Ctrl+D | Toggle debug panel |
| Ctrl+Scroll | Zoom in/out on canvas |

---

## Privacy and Data

**Your data never leaves your browser:**
- All processing happens locally
- No files are uploaded to any server
- Poster images stay on your computer
- OCR results are only stored in memory

This makes the app suitable for processing sensitive research materials.

---

## Need Help?

If you encounter issues not covered here:

1. Enable **Debug mode** (Ctrl+D) to see coordinate calculations
2. Check the Results panel for error messages
3. Try refreshing the page and starting over
4. Ensure your browser is up to date
