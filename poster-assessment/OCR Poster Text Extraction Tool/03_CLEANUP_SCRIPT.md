# OCR Cleanup Script — Technical Guide

## Overview

The cleanup script is a Python tool for post-processing raw OCR text extracted from scientific research posters. It corrects common OCR errors while preserving document structure.

## What It Does

The script takes raw OCR text and produces a cleaned version by:

1. **Fixing word splits** (hyphenation at line ends)
2. **Correcting common OCR substitutions** (t↔f, specific words)
3. **Normalizing gene names and IDs**
4. **Removing decorative elements**
5. **Preserving references structure**
6. **Grouping panels by section**

---

## OCR Errors Corrected

### 1. Common Character Substitutions

| OCR Error | Correction | Example |
|-----------|------------|---------|
| `t` → `f` (in certain contexts) | `to` | `t1` → `to1` |
| `confrol` | `control` | - |
| `communicafion` | `communication` | - |
| `communicafon` | `communication` | - |
| `thend` | `trend` | - |
| `frend` | `trend` | - |

### 2. Scientific Term Fixes

| OCR Error | Correction |
|-----------|------------|
| `DESeq` or `DESeq?` | `DESeq2` |
| `Clustr Profiler` or `ClustrProfiler` | `ClusterProfiler` |
| `Flybase` | `FlyBase` |
| `FlyBase` | `FlyBase` (no change) |
| `Deser` | `DESeq` |
| `Demeathylase` | `Demethylase` |
| `microblota` | `microbiota` |

### 3. Gene ID Corrections

Fixes malformed FlyBase gene IDs (format: FBgnXXXXXXX):

| Error Pattern | Example |
|--------------|---------|
| Extra zeros | FBgn003934% → FBgn0039349 |
| Truncated | FBgn020307 → FBgn0020307 |
| Mixed formats | FBgnO039349 → FBgn0039349 |

### 4. Word Split Fixes

| Pattern | Fix |
|---------|-----|
| Hyphen at line end + next line starts with lowercase | Remove hyphen, join words |
| Examples: `metabo-` + `lism` → `metabolism` |

### 5. Whitespace Normalization

| Issue | Fix |
|-------|-----|
| Multiple spaces | Single space |
| Trailing/leading whitespace | Trim |
| Tab characters | Replace with space |

### 6. Decorative Element Removal

These patterns are removed from content (not references):
- Lines of `=` characters
- `_____` or `———` separator lines
- `= 1` artifacts
- `ee ——]` markers

---

## How It Works

### Input Format
The script expects OCR text with section headers:
```
RESEARCH POSTER OCR RESULTS
================================================================================

================================================================================
SECTION: INTRODUCTION
================================================================================

[content here]
```

### Processing Pipeline

```
Raw OCR Text
    ↓
1. Fix Word Splits
    ↓
2. Remove Decorative Elements
    ↓
3. Fix Gene Names
    ↓
4. Fix General OCR Errors
    ↓
5. Fix Gene IDs (FlyBase)
    ↓
6. Normalize Whitespace
    ↓
7. Preserve References
    ↓
Cleaned Text
```

### Step 1: Fix Word Splits
```python
# Pattern: lowercase at line end + lowercase at next line start
# Example: "metabo-\nlism" → "metabolism"
```
Uses regex to find hyphenated line breaks and rejoin words.

### Step 2: Remove Decorative Elements
Removes visual separators that aren't content:
```python
decorative_patterns = [
    r'^=+$',           # Lines of equals
    r'^_{3,}',         # Underscore lines
    r'^_{5}\s',        # _____ patterns
    r'^=\s+\d+$',      # = 1, = 2, etc.
]
```

### Step 3: Fix Gene Names
```python
gene_fixes = [
    ('DESeq', 'DESeq2'),
    ('Deser', 'DESeq'),
    ('ClustrProfiler', 'ClusterProfiler'),
    ('Flybase', 'FlyBase'),
]
```

### Step 4: Fix General OCR Errors
```python
ocr_fixes = [
    ('confrol', 'control'),
    ('communicafion', 'communication'),
    ('communicafon', 'communication'),
    ('thend', 'trend'),
    ('frend', 'trend'),
]
```

### Step 5: Fix FlyBase Gene IDs
Uses pattern matching to identify and correct malformed IDs:
```python
# Pattern: FBgn followed by 7 digits
# Corrects: extra chars, missing digits, OCR artifacts
```

### Step 6: Preserve References
References section is processed differently:
- **BEFORE references**: Standard cleanup applied
- **REFERENCES section**: Structure preserved, only obvious errors fixed
- **AFTER references**: Not included in output

---

## Usage

### Basic Usage
```bash
python ocr_cleanup_script.py input.txt
```
Output: `input_cleaned.txt`

### Custom Output
```bash
python ocr_cleanup_script.py input.txt output.txt
```
Output: `output.txt`

### As a Module
```python
from ocr_cleanup_script import clean_text, group_panels_by_section

# Clean individual text
cleaned = clean_text(raw_ocr_text)

# Group panels by section and clean
results = group_panels_by_section(raw_results_text)
```

---

## Output Format

The cleaned text maintains the same structure as input:

```
RESEARCH POSTER OCR RESULTS
================================================================================

================================================================================
SECTION: TITLE
================================================================================

[cleaned title content]

================================================================================
SECTION: AUTHORS
================================================================================

[cleaned author list]

[... additional sections ...]
```

---

## Key Functions

### `clean_text(text)`
Main cleaning function. Applies all fixes in order.

**Parameters:**
- `text` (str): Raw OCR text

**Returns:**
- `str`: Cleaned text

### `group_panels_by_section(results_text)`
Groups OCR results by section type, combining multiple panels of same section.

**Parameters:**
- `results_text` (str): Combined OCR results from all panels

**Returns:**
- `str`: Formatted text with single header per section

### `fix_word_splits(text)`
Joins hyphenated line breaks.

### `fix_gene_names(text)`
Corrects scientific gene names.

### `fix_gene_ids(text)`
Fixes malformed FlyBase IDs.

### `preserve_references(text)`
Handles references section specially.

---

## Configuration

### Adding New Fixes
Edit the `fixes` arrays in `clean_text()`:

```python
# For character substitutions
('wrong', 'correct'),

# For regex patterns, add new functions
def fix_custom(text):
    # Custom logic
    return text
```

### Adjusting References Handling
Modify `preserve_references()` to change how references are processed.

---

## Limitations

1. **Context-insensitive** — Some fixes may not apply in all contexts
2. **Gene ID patterns** — Only recognizes standard FlyBase format
3. **References structure** — Assumes references start with `SECTION: REFERENCES`

---

## Examples

### Example 1: Character Substitution
**Input:** `t1 to t3 region`
**Output:** `to1 to to3 region`

### Example 2: Word Split
**Input:** 
```
The metabo-
lism of fatty
```
**Output:** `The metabolism of fatty`

### Example 3: Gene Name
**Input:** `Clustr Profiler was used`
**Output:** `ClusterProfiler was used`

### Example 4: Gene ID
**Input:** `FBgn003934%`
**Output:** `FBgn0039349`
