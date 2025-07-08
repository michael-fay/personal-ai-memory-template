#!/bin/bash

# Personal AI Memory System - Search Patterns Helper
# This script provides common search patterns for journal entries

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${BLUE}$1${NC}"
}

print_result() {
    echo -e "${GREEN}$1${NC}"
}

print_info() {
    echo -e "${YELLOW}$1${NC}"
}

# Check if we're in the right directory
if [[ ! -d "claude_journal" ]]; then
    echo -e "${RED}Error: claude_journal directory not found${NC}"
    echo "Please run this script from your AI memory system root directory"
    exit 1
fi

# Parse command line arguments
PATTERN=""
SEARCH_TYPE=""
GREP_PATTERN=""
SHOW_HELP=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--type)
            SEARCH_TYPE="$2"
            shift 2
            ;;
        -p|--pattern)
            PATTERN="$2"
            shift 2
            ;;
        -g|--grep)
            GREP_PATTERN="$2"
            shift 2
            ;;
        -h|--help)
            SHOW_HELP=true
            shift
            ;;
        *)
            PATTERN="$1"
            shift
            ;;
    esac
done

# Show help
if [[ "$SHOW_HELP" == "true" ]]; then
    print_header "🔍 Personal AI Memory Search Patterns"
    echo ""
    echo "Usage: $0 [OPTIONS] [PATTERN]"
    echo ""
    echo "Options:"
    echo "  -t, --type TYPE     Search by predefined type (see below)"
    echo "  -p, --pattern HEX   Search by hex pattern (e.g., '????01*')"
    echo "  -g, --grep TERM     Search file contents for term"
    echo "  -h, --help          Show this help"
    echo ""
    echo "Predefined Types:"
    echo "  today              Show today's entries"
    echo "  recent             Show 10 most recent entries"
    echo "  complete           Show all completed work"
    echo "  ongoing            Show all ongoing work"
    echo "  blocked            Show all blocked work"
    echo "  breakthroughs      Show all breakthrough moments"
    echo "  collaborative      Show all collaborative work"
    echo "  individual         Show all individual work"
    echo "  backend            Show all backend/API work"
    echo "  frontend           Show all frontend/UI work"
    echo "  infrastructure     Show all infrastructure work"
    echo "  research           Show all research work"
    echo "  debug              Show all debugging sessions"
    echo "  implementation     Show all implementation work"
    echo ""
    echo "Examples:"
    echo "  $0 today                          # Today's entries"
    echo "  $0 -t breakthroughs              # All breakthroughs"
    echo "  $0 -p '????01*'                 # All backend work"
    echo "  $0 -g 'authentication'           # Content search"
    echo "  $0 -t backend -g 'JWT'           # Backend work mentioning JWT"
    echo ""
    exit 0
fi

# Get current date in hex format
# Calculate days since 2025-01-01 (works on both Linux and macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    EPOCH_SECONDS=$(date -j -f "%Y-%m-%d" "2025-01-01" "+%s")
    CURRENT_SECONDS=$(date +%s)
else
    # Linux
    EPOCH_SECONDS=$(date -d "2025-01-01" +%s)
    CURRENT_SECONDS=$(date +%s)
fi

DAYS_SINCE_EPOCH=$(( (CURRENT_SECONDS - EPOCH_SECONDS) / 86400 ))
CURRENT_DATE_HEX=$(printf "%04X" $DAYS_SINCE_EPOCH)

# Handle predefined search types
case $SEARCH_TYPE in
    today)
        PATTERN="${CURRENT_DATE_HEX}*.md"
        ;;
    recent)
        print_header "📅 10 Most Recent Entries"
        ls -t claude_journal/*.md | head -10
        exit 0
        ;;
    complete)
        PATTERN="*01*.md"
        ;;
    ongoing)
        PATTERN="*02*.md"
        ;;
    blocked)
        PATTERN="*04*.md"
        ;;
    breakthroughs)
        PATTERN="*80*.md"
        ;;
    collaborative)
        PATTERN="*02.md"
        ;;
    individual)
        PATTERN="*01.md"
        ;;
    backend)
        PATTERN="??01*.md"
        ;;
    frontend)
        PATTERN="??02*.md"
        ;;
    infrastructure)
        PATTERN="??04*.md"
        ;;
    research)
        PATTERN="??20*.md"
        ;;
    debug)
        PATTERN="????04*.md"
        ;;
    implementation)
        PATTERN="????02*.md"
        ;;
esac

# Default to recent if no pattern specified
if [[ -z "$PATTERN" && -z "$SEARCH_TYPE" ]]; then
    SEARCH_TYPE="recent"
    print_header "📅 10 Most Recent Entries"
    ls -t claude_journal/*.md | head -10
    exit 0
fi

# Execute search
if [[ -n "$PATTERN" ]]; then
    # File pattern search
    FILES=$(ls claude_journal/$PATTERN 2>/dev/null | sort -r)
    
    if [[ -z "$FILES" ]]; then
        print_info "No files found matching pattern: $PATTERN"
        exit 0
    fi
    
    if [[ -n "$GREP_PATTERN" ]]; then
        # Combine file pattern with content search
        print_header "🔍 Files matching '$PATTERN' containing '$GREP_PATTERN'"
        echo "$FILES" | xargs grep -l -i "$GREP_PATTERN" 2>/dev/null | while read -r file; do
            print_result "$(basename "$file")"
            echo "   $(grep -i -n --color=never "$GREP_PATTERN" "$file" | head -3 | sed 's/^/   /')"
            echo ""
        done
    else
        # Just file pattern
        print_header "📁 Files matching pattern: $PATTERN"
        echo "$FILES" | while read -r file; do
            print_result "$(basename "$file")"
            # Show first few lines for context
            echo "   $(head -3 "$file" | tail -1 | sed 's/^/   /')"
        done
    fi
elif [[ -n "$GREP_PATTERN" ]]; then
    # Content-only search
    print_header "🔍 Entries containing '$GREP_PATTERN'"
    grep -l -i "$GREP_PATTERN" claude_journal/*.md 2>/dev/null | sort -r | while read -r file; do
        print_result "$(basename "$file")"
        echo "   $(grep -i -n --color=never "$GREP_PATTERN" "$file" | head -3 | sed 's/^/   /')"
        echo ""
    done
fi

# Common search patterns reference
if [[ "$SHOW_HELP" != "true" ]]; then
    echo ""
    print_info "💡 Tip: Use -h for more search options and examples"
fi