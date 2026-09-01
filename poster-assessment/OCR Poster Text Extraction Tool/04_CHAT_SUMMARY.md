# Chat Summary — C-MOOR Poster OCR Project

## Project Origin

A researcher working with student research posters needed a way to extract text from scientific posters for analysis. The initial request was to create OCR scripts to automate text extraction from posters uploaded to a folder system.

---

## Project Evolution

### Phase 1: Initial OCR Scripts (Automated Approach)
- Created Python-based OCR scripts using Tesseract
- Automated extraction from poster images
- Basic text cleanup for common OCR errors
- Attempted to create a **universal script** that would work for ALL posters automatically

**Why This Approach Failed:**

1. **Posters have inconsistent layouts** — Each research poster has its own unique layout with different fonts, colors, section placements, and designs. No single automated script could reliably detect section boundaries across different posters.

2. **Section boundaries are ambiguous** — Keywords like "Introduction", "Methods", "Results" appear in various locations and formats. Some sections have headers, some don't, and OCR detection of these headers was unreliable.

3. **Visual vs. semantic structure mismatch** — A poster's visual layout (columns, panels, regions) doesn't always align with its semantic structure (what content belongs to which section). Humans can easily identify sections by looking at a poster, but automating this requires sophisticated layout analysis.

4. **Error propagation** — When automated section detection fails, the entire output is compromised. There's no way to correct mistakes without human intervention.

5. **Poster diversity exceeded expectations** — The variety of poster formats from different institutions (Lesley University, Clovis Community College, etc.) meant that patterns detected in one poster often didn't apply to others.

**Conclusion:** An automated universal script would require ML-based layout understanding that was beyond scope. Instead, we pivoted to an **interactive tool** where humans draw panels over sections they want extracted.

---

### Phase 2: Interactive Tool Development
- Evolved from command-line scripts to browser-based tool
- Added panel drawing interface
- Implemented section-based extraction
- Users draw rectangles over poster regions
- Combined OCR + cleanup in one tool

### Phase 3: Coordinate System Refinement
- Fixed numerous zoom/pan coordinate bugs
- Implemented image-space coordinate system
- Ensured panels stay aligned regardless of zoom level

### Phase 4: Feature Enhancement
- Added text cleanup with spell-checker
- Dual output (Original + Cleaned)
- Image upscaling for better OCR
- Debug mode for troubleshooting

---

## Key Technical Decisions

### Browser-Based vs Server-Side
**Decision:** Browser-based (no server required)

**Rationale:**
- Privacy — poster images never leave user's computer
- Simplicity — no installation or server setup
- Portability — works on any device with a browser

### Tesseract.js vs Native Tesseract
**Decision:** Tesseract.js v5

**Rationale:**
- Runs entirely in browser
- No system-level installation needed
- Good accuracy for scientific text

### Image-Space Coordinate System
**Problem:** Panels drawn at one zoom level appeared in wrong positions at other zoom levels

**Solution:** Store all coordinates in original image pixels

- `getPos()` converts mouse → image-space on click
- `drawAllPanels()` converts image-space → display-space on draw
- OCR uses image-space coordinates directly

### Interactive vs. Automated
**Decision:** Interactive (user draws panels)

**Rationale:**
- Human judgment determines section boundaries
- Works with any poster layout
- Users can correct mistakes immediately
- No complex ML/layout analysis needed

---

## Major Features Implemented

| Feature | Status | Notes |
|---------|--------|-------|
| Image upload (drag/drop) | ✅ | - |
| Section selection | ✅ | 9 section types |
| Panel drawing | ✅ | Colored rectangles |
| Zoom controls | ✅ | 10%–400% |
| Pan (middle-click drag) | ✅ | - |
| Image upscaling | ✅ | 1x–8x, bicubic |
| OCR extraction | ✅ | Tesseract.js v5 |
| Text cleanup | ✅ | Spell-checker + fixes |
| Dual output | ✅ | Original + Cleaned |
| Debug mode | ✅ | Ctrl+D toggle |

---

## OCR Errors Addressed

### Character Substitutions
- `t` ↔ `f` confusion (context-aware fixes)
- `|I` confusion
- `confrol` → `control`
- `communicafion` → `communication`
- `thend/frend` → `trend`

### Scientific Term Corrections
- `DESeq`/`DESeq?` → `DESeq2`
- `Clustr Profiler` → `ClusterProfiler`
- `Flybase` → `FlyBase`
- `Demeathylase` → `Demethylase`

### Gene ID Corrections
Fixes malformed FlyBase IDs (FBgnXXXXXXX format):
- Removes OCR artifacts (%, o, O)
- Corrects digit swaps
- Adds missing leading zeros

---

## File Deliverables

| File | Purpose |
|------|---------|
| `poster_panel_define_ocr.html` | Main app — all-in-one tool |
| `ocr_cleanup_script.py` | Python cleanup (for batch processing) |
| `01_APP_FEATURES.md` | Feature overview |
| `02_USER_GUIDE.md` | End-user instructions |
| `03_CLEANUP_SCRIPT.md` | Cleanup algorithm documentation |
| `04_CHAT_SUMMARY.md` | This document |

---

## Usage Workflow

```
1. Upload poster image
       ↓
2. Select section type
       ↓
3. Draw panels over text regions
       ↓
4. Adjust zoom/upscale as needed
       ↓
5. Click "Run OCR"
       ↓
6. Review in Results panel
       ↓
7. Download Original and/or Cleaned
```

---

## Known Limitations

1. **Section detection** — Keywords used; may misclassify
2. **Spell checker** — Symmetric delete; limited dictionary
3. **References** — Processed specially (preserved structure)
4. **Non-English** — Configured for English only
5. **Large files** — Memory usage scales with image size

---

## Timeline Overview

| Date | Milestone |
|------|-----------|
| Session Start | Initial OCR script creation |
| Early | Interactive HTML tool development |
| Mid-session | Coordinate system fixes (multiple iterations) |
| Late | Cleanup script, documentation |
| Final | Reports and polish |

---

## Lessons Learned

### Why Automated Universal Scripts Fail for Posters

1. **Layout diversity** — Posters vary dramatically in organization
2. **Visual ambiguity** — Section boundaries aren't always clear to algorithms
3. **No correction mechanism** — Errors propagate without human review
4. **Context-dependent** — Same words can appear in different sections

### Coordinate Systems
When dealing with zoomable canvas apps:
1. Always use a consistent coordinate space
2. Store coordinates at highest resolution (original image)
3. Convert only at display/drawing time

### OCR Quality
- Upscaling helps significantly for small text
- Bicubic interpolation better than bilinear
- Context-aware fixes more accurate than global replacements

### User Interface
- Debug mode essential for troubleshooting
- Clear visual feedback (colors, labels) helps users
- Progressive enhancement (basic → advanced features)

---

## Future Considerations

Potential improvements mentioned during chat:
1. **Improved section detection** — ML-based classification
2. **Batch processing** — Process multiple posters
3. **Export formats** — PDF, DOCX support
4. **Spell-checker expansion** — Domain-specific vocabulary
5. **Multi-language support** — Non-English OCR

---

## Contact / Support

This tool was developed as a custom solution for C-MOOR research poster OCR needs.

For issues or questions:
- Enable Debug mode (Ctrl+D) for troubleshooting info
- Check USER_GUIDE.md for usage instructions
- Review TECHNICAL_GUIDE.md for implementation details