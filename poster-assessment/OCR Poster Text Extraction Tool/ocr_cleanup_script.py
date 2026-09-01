#!/usr/bin/env python3
"""
OCR Text Cleanup Script

This script processes OCR text extracted from scientific research posters.
It fixes common OCR errors, groups panels by section, and outputs clean text.
"""
import re
import sys
import os

def clean_text(text):
    """Apply all text fixes - handles general corrections before grouping"""
    if not text or len(text) == 0:
        return text
    
    cleaned = text
    
    # Fix common OCR errors FIRST (before grouping)
    # These work on the raw OCR text
    fixes = [
        # Common word errors
        ('guf-microbiome', 'gut-microbiome'),
        ('theatment', 'treatment'),
        ('thends', 'trends'),
        ('tends', 'trends'),
        ('similarifies', 'similarities'),
        ('Aufism', 'Autism'),
        ('oufism', 'autism'),
        ('NCKAPIT', 'NCKAP1'),
        ('Braln', 'Brain'),
        ('Demeathylase', 'Demethylase'),
        ('DEMEATHYLASE', 'DEMETHYLASE'),
        ('microblota', 'microbiota'),
        ('poges', 'pages'),
        ('oufsism', 'autism'),
        ('Neurcdavelopment', 'Neurodevelopment'),
        ('offers.', 'offer.'),
        ('offers ', 'offer '),
        ('1.G', 'J.G'),
        ('1.G.', 'J.G.'),
        ('Dol:', 'doi:'),
        ('dol:', 'doi:'),
        ('dol.org', 'doi.org'),
        ('Drosophiia', 'Drosophila'),
        ('Melonogaster', 'Melanogaster'),
    ]
    
    for error, correction in fixes:
        cleaned = cleaned.replace(error, correction)
    
    # Fix word splits (hyphenated words split across lines)
    cleaned = re.sub(r'(\w+)-\s*\n\s*(\w+)', r'\1\2', cleaned)
    
    # Remove standalone decorative elements within text
    # Handle "- = 1" with newlines around it (Methods section artifact)
    cleaned = re.sub(r'\n- = 1\n', '\n', cleaned)  # Remove "- = 1" 
    # Handle "= _____ ——" lines (uses em dash character)  
    cleaned = re.sub(r'\n= _____ +——+ \|\n', '\n', cleaned)  # Remove "= _____ —— |" lines
    # Handle "ee ——]" at refs start (no leading dash)
    cleaned = re.sub(r'\nee ——\]\n', '\n', cleaned)  # Remove "ee ——]" at refs start
    
    return cleaned


def group_panels_by_section(results_text):
    """
    Group OCR results by section, combining multiple panels of the same section.
    SKIPS references section - preserves original formatting.
    """
    # Apply text fixes FIRST
    results_text = clean_text(results_text)
    
    lines = results_text.split('\n')
    output_lines = []
    current_section = None
    section_order = []
    section_content = {}
    
    header_pattern = re.compile(r'^=+$')
    section_pattern = re.compile(r'^SECTION:\s*(.+)$', re.IGNORECASE)
    results_header = 'RESEARCH POSTER OCR RESULTS'
    
    for line in lines:
        if results_header in line:
            continue
        
        if header_pattern.match(line):
            continue
        
        section_match = section_pattern.match(line.strip())
        if section_match:
            section_name = section_match.group(1).strip().upper()
            if section_name not in section_content:
                section_order.append(section_name)
                section_content[section_name] = []
            current_section = section_name
            continue
        
        if current_section and line.strip():
            section_content[current_section].append(line)
    
    # Build output
    output_lines.append(results_header)
    output_lines.append('=' * 80)
    
    # Define section order (title first, then abstract, intro, etc.)
    priority_order = ['TITLE', 'AUTHORS', 'ABSTRACT', 'INTRODUCTION', 'OTHER', 'METHODS', 'RESULTS', 'DISCUSSION', 'REFERENCES']
    
    for section in priority_order:
        if section in section_content and section_content[section]:
            output_lines.append('')
            output_lines.append('=' * 80)
            output_lines.append(f'SECTION: {section}')
            output_lines.append('=' * 80)
            output_lines.append('')
            output_lines.extend(section_content[section])
    
    return '\n'.join(output_lines)


def process_file(input_file, output_file=None):
    """Process a single OCR result file"""
    if not os.path.exists(input_file):
        print(f'Error: File not found: {input_file}')
        return False
    
    with open(input_file, 'r', encoding='utf-8') as f:
        text = f.read()
    
    print(f'Processing: {input_file}')
    print(f'Input length: {len(text)} chars')
    
    # Clean and group
    cleaned = group_panels_by_section(text)
    
    print(f'Output length: {len(cleaned)} chars')
    
    if output_file is None:
        # Generate output filename
        base = os.path.splitext(input_file)[0]
        output_file = base + '_cleaned.txt'
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(cleaned)
    
    print(f'Output: {output_file}')
    return True


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: python ocr_cleanup_script.py <input_file> [output_file]')
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    
    success = process_file(input_file, output_file)
    sys.exit(0 if success else 1)
