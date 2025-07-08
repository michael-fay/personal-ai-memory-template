#!/bin/bash

# Personal AI Memory System - Three-Tier Architecture Installation Script
# This script sets up a workspace with shared journal repository

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

print_header "🧠 Personal AI Memory System - Workspace Setup"
echo ""
echo "This script will set up a new workspace with your shared journal repository."
echo "Three-tier architecture: Template → Journal Repository → Workspace"
echo ""

# Parse command line arguments
INTERACTIVE=true
TARGET_DIR=""
JOURNAL_REPO_URL=""
WORKSPACE_NAME=""
USER_NAME=""
USER_EMAIL=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -n|--non-interactive)
            INTERACTIVE=false
            shift
            ;;
        -t|--target)
            TARGET_DIR="$2"
            shift 2
            ;;
        --journal-repo)
            JOURNAL_REPO_URL="$2"
            shift 2
            ;;
        --workspace)
            WORKSPACE_NAME="$2"
            shift 2
            ;;
        --user-name)
            USER_NAME="$2"
            shift 2
            ;;
        --user-email)
            USER_EMAIL="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo "Options:"
            echo "  -n, --non-interactive    Run in non-interactive mode"
            echo "  -t, --target DIR         Target directory (default: current directory)"
            echo "  --journal-repo URL       Your personal AI memory repository URL"
            echo "  --workspace NAME         Workspace name"
            echo "  --user-name NAME         Your name"
            echo "  --user-email EMAIL       Your email"
            echo "  -h, --help              Show this help message"
            echo ""
            echo "Example:"
            echo "  $0 --journal-repo https://github.com/username/my-ai-journal"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Set target directory (default to current directory)
if [[ -z "$TARGET_DIR" ]]; then
    TARGET_DIR="$(pwd)"
fi

# Interactive prompts
if [[ "$INTERACTIVE" == "true" ]]; then
    print_header "📝 Workspace Configuration"
    echo ""
    
    # Get journal repository URL
    if [[ -z "$JOURNAL_REPO_URL" ]]; then
        echo "Enter your personal AI memory repository URL:"
        echo "Example: https://github.com/username/my-ai-journal"
        echo "         git@github.com:username/my-ai-journal.git"
        read -p "Journal Repository URL: " JOURNAL_REPO_URL
    fi
    
    # Get workspace name
    if [[ -z "$WORKSPACE_NAME" ]]; then
        WORKSPACE_NAME="$(basename "$TARGET_DIR")"
        read -p "Workspace name [$WORKSPACE_NAME]: " input
        if [[ -n "$input" ]]; then
            WORKSPACE_NAME="$input"
        fi
    fi
    
    # Get user information
    if [[ -z "$USER_NAME" ]]; then
        read -p "Your name: " USER_NAME
    fi
    
    if [[ -z "$USER_EMAIL" ]]; then
        read -p "Your email: " USER_EMAIL
    fi
fi

# Validate required parameters
if [[ -z "$JOURNAL_REPO_URL" ]]; then
    print_error "Journal repository URL is required"
    exit 1
fi

if [[ -z "$WORKSPACE_NAME" ]]; then
    WORKSPACE_NAME="$(basename "$TARGET_DIR")"
fi

if [[ -z "$USER_NAME" ]]; then
    USER_NAME="User"
fi

if [[ -z "$USER_EMAIL" ]]; then
    USER_EMAIL="user@example.com"
fi

print_header "🚀 Setting up workspace: $WORKSPACE_NAME"
echo ""

# Check if we're already in the target directory
if [[ "$TARGET_DIR" != "$(pwd)" ]]; then
    print_status "Changing to target directory: $TARGET_DIR"
    cd "$TARGET_DIR"
fi

# Step 1: Clone journal repository
print_status "Cloning journal repository..."
if [[ -d "claude_journal" ]]; then
    print_warning "claude_journal directory already exists, removing it..."
    rm -rf claude_journal
fi

git clone "$JOURNAL_REPO_URL" claude_journal
cd claude_journal

# Step 2: Get the template content
print_status "Generating workspace CLAUDE.md from template..."
if [[ ! -f ".bootstrap/__CLAUDE_TEMPLATE.md" ]]; then
    print_error "Template file not found in journal repository"
    print_error "Make sure your journal repo has the .bootstrap directory"
    exit 1
fi

# Step 3: Create workspace CLAUDE.md
cd ..
cp claude_journal/.bootstrap/__CLAUDE_TEMPLATE.md CLAUDE.md

# Step 4: Customize CLAUDE.md for workspace
print_status "Customizing CLAUDE.md for workspace..."

# Add workspace-specific header
cat > CLAUDE_temp.md << EOF
# Claude Code Memory - $WORKSPACE_NAME Workspace

## 🚨 WORKSPACE CONTEXT
**Workspace**: $WORKSPACE_NAME  
**User**: $USER_NAME  
**Email**: $USER_EMAIL  
**Journal Repository**: $JOURNAL_REPO_URL  

## 📝 TEMPLATE UPDATE PROTOCOL
**CRITICAL**: When updating workspace instructions in this CLAUDE.md file, also update the template at:
\`./claude_journal/.bootstrap/__CLAUDE_TEMPLATE.md\`

This ensures improvements flow to future workspaces and the broader template community.

---

EOF

# Append the template content
cat CLAUDE.md >> CLAUDE_temp.md
mv CLAUDE_temp.md CLAUDE.md

# Step 5: Create claude_artifacts directory
print_status "Creating claude_artifacts directory..."
mkdir -p claude_artifacts

# Step 6: Create example artifact
cat > claude_artifacts/workspace_setup_$(date +%Y%m%d_%H%M%S).md << EOF
# Workspace Setup - $WORKSPACE_NAME

**Date**: $(date +"%Y-%m-%d %H:%M:%S")  
**Workspace**: $WORKSPACE_NAME  
**Journal Repository**: $JOURNAL_REPO_URL  

## Setup Details
- **Target Directory**: $TARGET_DIR
- **Journal Repository**: Cloned to ./claude_journal/
- **CLAUDE.md**: Generated from template with workspace customizations
- **claude_artifacts/**: Created for workspace-specific artifacts

## Three-Tier Architecture
1. **Template Repository**: michael-fay/personal-ai-memory-template
2. **Journal Repository**: $JOURNAL_REPO_URL
3. **Workspace**: $WORKSPACE_NAME (this directory)

## Usage
- Edit CLAUDE.md for workspace-specific instructions
- Remember to update ./claude_journal/.bootstrap/__CLAUDE_TEMPLATE.md when making improvements
- Use claude_artifacts/ for temporary analysis, scripts, and context documents
- Journal entries go in ./claude_journal/ (shared across all workspaces)
EOF

# Step 7: Create .gitignore for workspace
cat > .gitignore << EOF
# Claude AI Memory System
# Journal is managed separately - do not commit journal to workspace repos
claude_journal/

# Temporary artifacts that shouldn't be committed
claude_artifacts/temp_*
claude_artifacts/analysis_*

# Common development files
.DS_Store
*.log
*.tmp
.env
.env.local
node_modules/
.vscode/
.idea/
EOF

# Step 8: Success message
print_header "✅ Workspace setup complete!"
echo ""
echo "Your workspace is ready with the following structure:"
echo "  📁 $WORKSPACE_NAME/"
echo "  ├── 📄 CLAUDE.md (workspace-specific instructions)"
echo "  ├── 📁 claude_artifacts/ (workspace artifacts)"
echo "  ├── 📁 claude_journal/ (shared journal repository)"
echo "  └── 📄 .gitignore (workspace gitignore)"
echo ""
echo "Next steps:"
echo "1. Start Claude Code in this directory"
echo "2. Edit CLAUDE.md for your workspace-specific needs"
echo "3. Remember to update ./claude_journal/.bootstrap/__CLAUDE_TEMPLATE.md with improvements"
echo "4. Add your project repositories to this workspace"
echo ""
echo "Happy coding! 🚀"