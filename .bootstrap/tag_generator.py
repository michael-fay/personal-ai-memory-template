#!/usr/bin/env python3
"""
Personal AI Memory System - Tag Generator
This script helps generate hex tags for journal entries
"""

import argparse
import sys
from datetime import datetime, date
import json
import os

# Color codes for output
class Colors:
    RED = '\033[0;31m'
    GREEN = '\033[0;32m'
    YELLOW = '\033[0;33m'
    BLUE = '\033[0;34m'
    NC = '\033[0m'  # No Color

def print_header(text):
    print(f"{Colors.BLUE}{text}{Colors.NC}")

def print_success(text):
    print(f"{Colors.GREEN}{text}{Colors.NC}")

def print_warning(text):
    print(f"{Colors.YELLOW}{text}{Colors.NC}")

def print_error(text):
    print(f"{Colors.RED}{text}{Colors.NC}")

def calculate_date_hex(target_date=None):
    """Calculate hex representation of days since 2025-01-01"""
    epoch = date(2025, 1, 1)
    if target_date is None:
        target_date = date.today()
    
    delta = target_date - epoch
    return f"{delta.days:04X}"

def load_schema():
    """Load the tag bitmap schema from tag_bitmap.md"""
    schema_path = "claude_journal/tag_bitmap.md"
    
    if not os.path.exists(schema_path):
        print_error("Error: claude_journal/tag_bitmap.md not found")
        print_error("Please run this script from your AI memory system root directory")
        sys.exit(1)
    
    # Default schema structure
    schema = {
        'workspace': {
            0x01: 'Work',
            0x02: 'Personal', 
            0x04: 'Consulting',
            0x08: 'Research',
            0x10: 'Creative'
        },
        'technology': {
            0x01: 'Backend/API',
            0x02: 'Frontend/UI',
            0x04: 'Infrastructure',
            0x08: 'Data/Analytics',
            0x10: 'Mobile',
            0x20: 'Research',
            0x40: 'Documentation'
        },
        'activity': {
            0x01: 'Design/Architecture',
            0x02: 'Implementation',
            0x04: 'Debug/Troubleshoot',
            0x08: 'Testing/Validation',
            0x10: 'Deploy/Release',
            0x20: 'Research/Investigation',
            0x40: 'Analysis'
        },
        'status': {
            0x01: 'Complete/Success',
            0x02: 'Ongoing/In Progress',
            0x04: 'Blocked/Stuck',
            0x08: 'Experimental',
            0x10: 'Critical/High Priority',
            0x20: 'Learning/Training',
            0x40: 'Review/Evaluation',
            0x80: 'Breakthrough/Discovery'
        },
        'context': {
            0x01: 'Individual',
            0x02: 'Collaborative',
            0x04: 'Deep Focus',
            0x08: 'Cross-Project',
            0x10: 'Meeting/Communication',
            0x20: 'Client/External'
        }
    }
    
    return schema

def interactive_tag_builder():
    """Interactive tag builder"""
    print_header("🏷️ Interactive Tag Builder")
    print("Let's build your hex tag step by step!\n")
    
    schema = load_schema()
    
    # Date
    date_hex = calculate_date_hex()
    print(f"📅 Date: {date_hex} ({date.today().strftime('%Y-%m-%d')})")
    
    # Session
    session_num = input("🔢 Session number (1-255): ").strip()
    if not session_num.isdigit() or int(session_num) < 1 or int(session_num) > 255:
        session_num = "1"
    session_hex = f"{int(session_num):02X}"
    
    # Workspace
    print("\n🏢 Workspace Domain:")
    for bit, desc in schema['workspace'].items():
        print(f"   {bit:02X} - {desc}")
    
    workspace_bits = input("Select workspace bits (e.g., 01 or 03 for combined): ").strip()
    if not workspace_bits:
        workspace_bits = "01"
    workspace_hex = workspace_bits.upper().zfill(2)
    
    print("\n🏗️ Reserved bits available for future customization (128 bits)")
    print("   Starting with minimal schema - expand based on your work patterns!")
    
    # Build final tag (minimal format)
    reserved_hex = "00000000000000000000000000000000"  # 32 hex chars = 128 bits
    tag = f"{date_hex}{session_hex}{workspace_hex}{reserved_hex}"
    
    print("\n" + "="*50)
    print_success(f"🎉 Generated Tag: {tag}")
    print_success(f"📁 Filename: {tag}.md")
    print("="*50)
    
    return tag

def decode_tag(tag):
    """Decode a hex tag into its components"""
    if len(tag) != 40:
        print_error("Error: Tag must be exactly 40 hex characters")
        return None
    
    try:
        # Parse components
        date_hex = tag[0:4]
        session_hex = tag[4:6]
        workspace_hex = tag[6:8]
        reserved_hex = tag[8:40]
        
        # Convert date
        days_since_epoch = int(date_hex, 16)
        epoch = date(2025, 1, 1)
        tag_date = epoch + datetime.timedelta(days=days_since_epoch)
        
        # Convert session
        session_num = int(session_hex, 16)
        
        print_header(f"🔍 Decoding Tag: {tag}")
        print(f"📅 Date: {tag_date.strftime('%Y-%m-%d')} ({date_hex})")
        print(f"🔢 Session: {session_num} ({session_hex})")
        print(f"🏢 Workspace: {workspace_hex}")
        print(f"🏗️ Reserved: {reserved_hex} (Available for customization)")
        
        return {
            'date': tag_date,
            'session': session_num,
            'workspace': workspace_hex,
            'reserved': reserved_hex
        }
        
    except ValueError:
        print_error("Error: Invalid hex characters in tag")
        return None

def generate_search_patterns():
    """Generate common search patterns"""
    patterns = {
        "Today's entries": f"{calculate_date_hex()}*.md",
        "Recent entries": "*.md | head -10",
        "All work projects": "????01*.md",
        "All personal projects": "????02*.md",
        "All consulting work": "????04*.md",
        "All research work": "????08*.md",
        "All combined workspaces": "????0[357]*.md",
        "This month's work": f"{calculate_date_hex()[:3]}?*.md",
        "Session 1 entries": "????01*.md",
        "Session 2 entries": "????02*.md"
    }
    
    print_header("🔍 Common Search Patterns")
    for description, pattern in patterns.items():
        print(f"   {description}: ls claude_journal/{pattern}")
    
    return patterns

def main():
    parser = argparse.ArgumentParser(description='Personal AI Memory System - Tag Generator')
    parser.add_argument('--interactive', '-i', action='store_true', help='Interactive tag builder')
    parser.add_argument('--decode', '-d', type=str, help='Decode a hex tag')
    parser.add_argument('--patterns', '-p', action='store_true', help='Show search patterns')
    parser.add_argument('--date', type=str, help='Date for tag (YYYY-MM-DD format)')
    parser.add_argument('--session', type=int, help='Session number (1-255)')
    parser.add_argument('--workspace', type=str, help='Workspace hex code')
    parser.add_argument('--technology', type=str, help='Technology hex code')
    parser.add_argument('--activity', type=str, help='Activity hex code')
    parser.add_argument('--status', type=str, help='Status hex code')
    parser.add_argument('--context', type=str, help='Context hex code')
    
    args = parser.parse_args()
    
    if args.interactive:
        interactive_tag_builder()
    elif args.decode:
        decode_tag(args.decode)
    elif args.patterns:
        generate_search_patterns()
    elif any([args.date, args.session, args.workspace, args.technology, args.activity, args.status, args.context]):
        # Build tag from individual components
        target_date = date.today()
        if args.date:
            try:
                target_date = datetime.strptime(args.date, '%Y-%m-%d').date()
            except ValueError:
                print_error("Error: Date must be in YYYY-MM-DD format")
                sys.exit(1)
        
        date_hex = calculate_date_hex(target_date)
        session_hex = f"{args.session or 1:02X}"
        workspace_hex = (args.workspace or "01").upper().zfill(2)
        tech_hex = (args.technology or "01").upper().zfill(2)
        activity_hex = (args.activity or "01").upper().zfill(2)
        status_hex = (args.status or "01").upper().zfill(2)
        context_hex = (args.context or "01").upper().zfill(2)
        
        reserved_hex = "00000000000000000000000000000000"  # Default minimal format
        tag = f"{date_hex}{session_hex}{workspace_hex}{reserved_hex}"
        
        print_success(f"Generated Tag: {tag}")
        print_success(f"Filename: {tag}.md")
    else:
        # Show help and current date
        print_header("🏷️ Personal AI Memory System - Tag Generator")
        print(f"📅 Today's date hex: {calculate_date_hex()} ({date.today().strftime('%Y-%m-%d')})")
        print("\nUse -h for help with options, or -i for interactive mode")

if __name__ == "__main__":
    main()