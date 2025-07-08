#!/bin/bash

# Personal AI Memory System - Installation Script
# This script sets up the personal AI memory system in your workspace

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}$1${NC}"
}

# Check if we're running from curl | bash (no local template files)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TEMPLATE_ROOT="$(dirname "$SCRIPT_DIR")"
REMOTE_INSTALL=false

# If we can't find template files, we're running remotely
if [[ ! -f "$TEMPLATE_ROOT/__CLAUDE_TEMPLATE.md" ]] || [[ ! -f "$TEMPLATE_ROOT/claude_journal/tag_bitmap.md" ]]; then
    REMOTE_INSTALL=true
    print_status "Running remote installation from curl | bash"
fi

print_header "🧠 Personal AI Memory System Setup"
echo ""
echo "This script will set up your personal AI memory system."
echo "You can run this in interactive mode or use the default configuration."
echo ""

# Parse command line arguments
INTERACTIVE=false
TARGET_DIR=""
TEMPLATE_TYPE=""
USER_REPO_URL=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -i|--interactive)
            INTERACTIVE=true
            shift
            ;;
        -t|--target)
            TARGET_DIR="$2"
            shift 2
            ;;
        --template)
            TEMPLATE_TYPE="$2"
            shift 2
            ;;
        --repo)
            USER_REPO_URL="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo "Options:"
            echo "  -i, --interactive    Run in interactive mode"
            echo "  -t, --target DIR     Target directory (default: current directory)"
            echo "  --template TYPE      Use predefined template (developer, researcher, consultant)"
            echo "  --repo URL           Your personal AI memory repository URL"
            echo "  -h, --help          Show this help message"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Handle remote installation - clone user's repo first
if [[ "$REMOTE_INSTALL" == "true" ]]; then
    print_header "📥 Remote Installation Mode"
    echo ""
    
    # Get user's repo URL if not provided
    if [[ -z "$USER_REPO_URL" ]]; then
        echo "We need to clone your personal AI memory repository."
        echo "After clicking 'Use this template', you should have a repo like:"
        echo "  https://github.com/YOUR_USERNAME/my-ai-memory"
        echo "  git@github.com:YOUR_USERNAME/my-ai-memory.git"
        echo ""
        read -p "Enter your repository URL (SSH or HTTPS): " USER_REPO_URL
    fi
    
    # Validate repo URL
    if [[ -z "$USER_REPO_URL" ]]; then
        print_error "Repository URL is required for remote installation"
        exit 1
    fi
    
    # Extract repo name from URL
    REPO_NAME=$(basename "$USER_REPO_URL" .git)
    
    print_status "Cloning your repository: $USER_REPO_URL"
    
    # Clone the user's repo
    if git clone "$USER_REPO_URL" "$REPO_NAME"; then
        print_status "Successfully cloned $REPO_NAME"
        cd "$REPO_NAME"
        TARGET_DIR="$(pwd)"
        
        # Update paths for local execution
        SCRIPT_DIR="$TARGET_DIR/scripts"
        TEMPLATE_ROOT="$TARGET_DIR"
        REMOTE_INSTALL=false
    else
        print_error "Failed to clone repository: $USER_REPO_URL"
        print_error "Please check the URL and your permissions"
        exit 1
    fi
fi

# Default target directory
if [[ -z "$TARGET_DIR" ]]; then
    TARGET_DIR="$(pwd)"
fi

print_status "Target directory: $TARGET_DIR"

# Interactive mode
if [[ "$INTERACTIVE" == "true" ]]; then
    print_header "📝 Interactive Setup"
    echo ""
    
    # Get user information
    read -p "Enter your name: " USER_NAME
    read -p "Describe your working style (e.g., 'Deep focus sessions', 'Collaborative problem-solving'): " WORKING_STYLE
    read -p "What's your professional background? (e.g., 'Software engineer', 'Data scientist', 'Consultant'): " BACKGROUND
    
    echo ""
    print_status "Available templates:"
    echo "1. Generic - Basic template with common domains"
    echo "2. Developer - Software engineering focused"
    echo "3. Researcher - Academic and research workflows"
    echo "4. Consultant - Client work and business development"
    echo "5. Creative - Design and creative work patterns"
    echo ""
    
    read -p "Select template (1-5): " TEMPLATE_CHOICE
    
    case $TEMPLATE_CHOICE in
        1) TEMPLATE_TYPE="generic" ;;
        2) TEMPLATE_TYPE="developer" ;;
        3) TEMPLATE_TYPE="researcher" ;;
        4) TEMPLATE_TYPE="consultant" ;;
        5) TEMPLATE_TYPE="creative" ;;
        *) TEMPLATE_TYPE="generic" ;;
    esac
    
    # Ask about git setup
    echo ""
    read -p "Do you want to initialize a git repository for your journal? (y/n): " INIT_GIT
    read -p "Enter your main project name (optional): " PROJECT_NAME
    read -p "Enter your main project description (optional): " PROJECT_DESC
else
    # Non-interactive defaults
    USER_NAME="[YOUR_NAME]"
    WORKING_STYLE="[DESCRIBE YOUR WORK PATTERNS]"
    BACKGROUND="[YOUR PROFESSIONAL BACKGROUND]"
    TEMPLATE_TYPE="${TEMPLATE_TYPE:-generic}"
    INIT_GIT="n"
    PROJECT_NAME="[DESCRIBE YOUR MAIN PROJECT]"
    PROJECT_DESC="[DESCRIBE YOUR OVERALL GOALS AND VISION]"
fi

print_status "Using template: $TEMPLATE_TYPE"

# Create directory structure
print_status "Creating directory structure..."
mkdir -p "$TARGET_DIR/claude_journal"
mkdir -p "$TARGET_DIR/claude_artifacts"

# Copy and customize CLAUDE.md
print_status "Setting up CLAUDE.md..."
cp "$TEMPLATE_ROOT/__CLAUDE_TEMPLATE.md" "$TARGET_DIR/CLAUDE.md"

# Replace placeholders in CLAUDE.md
sed -i.bak "s/\[YOUR_NAME\]/$USER_NAME/g" "$TARGET_DIR/CLAUDE.md"
sed -i.bak "s/\[DESCRIBE YOUR WORK PATTERNS[^]]*\]/$WORKING_STYLE/g" "$TARGET_DIR/CLAUDE.md"
sed -i.bak "s/\[YOUR PROFESSIONAL BACKGROUND[^]]*\]/$BACKGROUND/g" "$TARGET_DIR/CLAUDE.md"
sed -i.bak "s/\[DESCRIBE YOUR MAIN PROJECT\]/$PROJECT_NAME/g" "$TARGET_DIR/CLAUDE.md"
sed -i.bak "s/\[DESCRIBE YOUR OVERALL GOALS AND VISION\]/$PROJECT_DESC/g" "$TARGET_DIR/CLAUDE.md"

# Remove backup file
rm "$TARGET_DIR/CLAUDE.md.bak"

# Copy and customize tag_bitmap.md based on template type
print_status "Setting up tag bitmap schema..."
if [[ -f "$TEMPLATE_ROOT/templates/${TEMPLATE_TYPE}_tag_bitmap.md" ]]; then
    cp "$TEMPLATE_ROOT/templates/${TEMPLATE_TYPE}_tag_bitmap.md" "$TARGET_DIR/claude_journal/tag_bitmap.md"
else
    cp "$TEMPLATE_ROOT/claude_journal/tag_bitmap.md" "$TARGET_DIR/claude_journal/tag_bitmap.md"
fi

# Copy helper scripts
print_status "Installing helper scripts..."
cp -r "$TEMPLATE_ROOT/scripts" "$TARGET_DIR/"
chmod +x "$TARGET_DIR/scripts/"*.sh

# Initialize git repository if requested
if [[ "$INIT_GIT" == "y" ]] || [[ "$INIT_GIT" == "Y" ]]; then
    print_status "Initializing git repository..."
    cd "$TARGET_DIR"
    
    if [[ ! -d ".git" ]]; then
        git init
        echo "# Personal AI Memory System" > README.md
        echo "" >> README.md
        echo "This repository contains my personal AI memory system using hex-indexed journal entries." >> README.md
        echo "" >> README.md
        echo "## Usage" >> README.md
        echo "" >> README.md
        echo "- \`CLAUDE.md\` - AI assistant instructions" >> README.md
        echo "- \`claude_journal/\` - Journal entries with hex indexing" >> README.md
        echo "- \`claude_artifacts/\` - Additional project context" >> README.md
        echo "" >> README.md
        echo "## Getting Started" >> README.md
        echo "" >> README.md
        echo "1. Review and customize \`CLAUDE.md\` for your needs" >> README.md
        echo "2. Update \`claude_journal/tag_bitmap.md\` with your domains" >> README.md
        echo "3. Create your first journal entry" >> README.md
        echo "4. Start using the system with your AI assistant" >> README.md
        
        # Create .gitignore
        echo "# Personal AI Memory System" > .gitignore
        echo "" >> .gitignore
        echo "# Ignore sensitive files" >> .gitignore
        echo "*.log" >> .gitignore
        echo "*.tmp" >> .gitignore
        echo ".DS_Store" >> .gitignore
        echo "" >> .gitignore
        echo "# Include journal entries and artifacts" >> .gitignore
        echo "!claude_journal/*.md" >> .gitignore
        echo "!claude_artifacts/*.md" >> .gitignore
        
        git add .
        git commit -m "Initial setup of personal AI memory system"
        print_status "Git repository initialized with initial commit"
    else
        print_warning "Git repository already exists"
    fi
    
    cd - > /dev/null
fi

# Create example journal entry
print_status "Creating example journal entry..."
CURRENT_DATE=$(date +%Y-%m-%d)

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
DATE_HEX=$(printf "%04X" $DAYS_SINCE_EPOCH)
# Format: [DATE:4][SESSION:2][WS:2][TD:2][AD:2][SD:2][CD:2] = 16 chars
# DATE(4) + SESSION(2) + WORKSPACE(2) + TECH(2) + ACTIVITY(2) + STATUS(2) + CONTEXT(2) = 16
EXAMPLE_FILENAME="${DATE_HEX}010140010101.md"

cat > "$TARGET_DIR/claude_journal/$EXAMPLE_FILENAME" << EOF
# Setup Session - Personal AI Memory System
## Session: $CURRENT_DATE - Session 1
### 🎯 Session Overview
**Duration**: 30 minutes
**Focus**: Initial setup of personal AI memory system
**Status**: ✅ COMPLETE - System successfully configured and ready for use
**Scope**: Individual setup and configuration

### 📋 Session Accomplishments
1. **System Installation**: Successfully installed personal AI memory template
2. **Schema Configuration**: Set up tag bitmap schema for my work patterns
3. **Initial Setup**: Configured CLAUDE.md with personal preferences
4. **Git Repository**: ${INIT_GIT:-n} repository for version control
5. **Helper Scripts**: Installed search and utility scripts

### 🔧 Technical Decisions
- **Template Type**: Selected $TEMPLATE_TYPE template for my work style
- **Directory Structure**: Standard layout with claude_journal/ and claude_artifacts/
- **Hex Indexing**: Using 64-bit hex tag system for fast pattern retrieval
- **Git Integration**: ${INIT_GIT:-n} version control for journal entries

### 🎯 Next Steps
1. **Customize Schema**: Review and adjust tag_bitmap.md domains for my specific needs
2. **Test Searches**: Try some basic search patterns to verify hex indexing works
3. **First Real Entry**: Create first journal entry for actual work session
4. **Refine System**: Adjust categories based on initial usage patterns

### 💡 Key Insights
- The hex indexing system provides powerful search capabilities
- Template customization makes the system adaptable to different work styles
- Git integration allows for backup and version control of insights
- Helper scripts simplify common search operations

### 🔄 System Status
- **Installation**: Complete
- **Configuration**: Ready for use
- **Documentation**: Available in README.md and docs/
- **Next Session**: Ready to start using system for real work

### 🏷️ Tags Used
- **Date**: $DATE_HEX ($(date +%Y-%m-%d))
- **Session**: 01 (First session)
- **Workspace**: 01 (Work/Primary)
- **Technology**: 40 (Documentation/Setup)
- **Activity**: 01 (Design/Setup)
- **Status**: 01 (Complete)
- **Context**: 01 (Individual)

---
*This entry was created during the initial setup of the personal AI memory system.*
EOF

print_status "Example journal entry created: $EXAMPLE_FILENAME"

# Create helper aliases
print_status "Setting up helper aliases..."
cat > "$TARGET_DIR/ai_memory_aliases.sh" << 'EOF'
#!/bin/bash

# Personal AI Memory System - Helper Aliases
# Source this file to add helpful aliases to your shell

# Journal entry creation
alias journal_new='scripts/create_journal_entry.sh'
alias journal_search='scripts/search_journal.sh'

# Common search patterns
alias today_entries='ls claude_journal/$(printf "%04X" $(( ($(date +%s) - $(date -d "2025-01-01" +%s)) / 86400 )))*.md'
alias recent_entries='ls -t claude_journal/*.md | head -10'
alias all_breakthroughs='ls claude_journal/*80*.md'
alias all_completed='ls claude_journal/*01*.md'

# Git operations
alias journal_commit='cd claude_journal && git add . && git commit -m "Journal entries update" && cd ..'
alias journal_status='cd claude_journal && git status && cd ..'

echo "Personal AI Memory System aliases loaded!"
echo "Available commands:"
echo "  journal_new      - Create new journal entry"
echo "  journal_search   - Search journal entries"
echo "  today_entries    - Show today's entries"
echo "  recent_entries   - Show 10 most recent entries"
echo "  all_breakthroughs - Show all breakthrough entries"
echo "  all_completed    - Show all completed work"
echo "  journal_commit   - Commit journal changes"
echo "  journal_status   - Check git status"
EOF

chmod +x "$TARGET_DIR/ai_memory_aliases.sh"

# Print completion message
echo ""
print_header "🎉 Setup Complete!"
echo ""
print_status "Personal AI Memory System successfully installed!"
echo ""
echo "📁 Files created:"
echo "   - CLAUDE.md (AI assistant instructions)"
echo "   - claude_journal/tag_bitmap.md (hex indexing schema)"
echo "   - claude_journal/$EXAMPLE_FILENAME (example entry)"
echo "   - scripts/ (helper utilities)"
echo "   - ai_memory_aliases.sh (shell aliases)"
echo ""
echo "🚀 Next steps:"
echo "   1. Review and customize CLAUDE.md for your specific needs"
echo "   2. Update claude_journal/tag_bitmap.md with your work domains"
echo "   3. Load aliases: source ai_memory_aliases.sh"
echo "   4. Start your first AI conversation with the system"
echo ""
echo "📖 Documentation:"
echo "   - README.md for detailed usage instructions"
echo "   - docs/ directory for guides and examples"
echo ""
echo "💡 Tips:"
echo "   - Use 'journal_search' to find entries by pattern"
echo "   - Use 'today_entries' to see today's work"
echo "   - Customize the tag bitmap as your work patterns evolve"
echo ""
print_status "Happy journaling! 🧠✨"