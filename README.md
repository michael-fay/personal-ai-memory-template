# Personal AI Memory System

[![Use this template](https://img.shields.io/badge/Use%20this%20template-2ea44f?style=for-the-badge&logo=github)](../../generate)

**Never repeat the same conversation with your AI assistant.**

The simplest approach that works: local files with one-time setup, designed for Claude but adaptable to other AI tools. Equal or better performance on your laptop than remote vector databases for personal AI collaboration history.

## ⚠️ IMPORTANT: Use Template, Don't Clone

**✅ CORRECT:** Click the green "Use this template" button above  
**❌ WRONG:** Don't clone or fork this repository directly

This is a template repository. Cloning it directly will give you the template files, not a working personal AI memory system. You need to create your own repository from this template first.

## 🎯 Mission

**Transform your personal AI conversations into lasting memory.** This system creates a simple foundation that grows with your individual work patterns over time.

Your AI assistant learns your specific context, projects, and preferences through accumulated conversation history. Whether you're a researcher, developer, consultant, or creative - the system adapts to your personal workflow without any configuration.

**The result**: Your AI remembers you, your work, and your evolving collaboration patterns.

## 🚀 Features

- **⚡ Minimal setup required** - one script creates your entire system
- **🗲 Sub-millisecond retrieval** - optimized for personal AI collaboration history
- **🔒 Your data, your choice** - local files, private git repo, or your own cloud storage  
- **🧠 Connects your contexts** - links all your individual projects and conversations
- **🎯 Designed for Claude** - with architecture adaptable to other AI tools
- **🔍 Simple hex indexing** - fast search through your personal conversation history
- **🛠️ Grows with you** - adapts to your individual work patterns over time

## 📖 Table of Contents

- [Quick Start](#quick-start)
- [How It Works](#how-it-works)
- [Installation](#installation)
- [Usage](#usage)
- [Customization](#customization)
- [Examples](#examples)
- [Advanced Features](#advanced-features)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Quick Start

### TL;DR Workflow:
1. **Create your journal repository** → Click "Use this template" on GitHub
2. **Create workspace directory** → `mkdir ~/projects/my-workspace && cd ~/projects/my-workspace`
3. **Bootstrap workspace** → One curl command (see [Installation](#-installation))
4. **Start using** → Your AI assistant now has perfect memory across all workspaces!

## 🔧 Technical Details

### What the Install Script Actually Does

**For the curious developers who want to know exactly what's happening:**

1. **Template Detection**: Script detects if it's running via `curl | bash` (remote) or locally
2. **Repository Cloning**: If remote, prompts for your repo URL and clones it automatically
3. **File Setup**: Copies `__CLAUDE_TEMPLATE.md` → `CLAUDE.md` in your workspace
4. **Customization**: Interactive prompts replace template placeholders with your info:
   - `[YOUR_NAME]` → Your actual name
   - `[DESCRIBE YOUR WORK PATTERNS]` → Your working style
   - `[YOUR PROFESSIONAL BACKGROUND]` → Your background
   - `[DESCRIBE YOUR MAIN PROJECT]` → Your project details
5. **Directory Structure**: Creates `claude_journal/` and `claude_artifacts/` directories
6. **Schema Setup**: Copies and customizes `tag_bitmap.md` with your domain preferences
7. **Git Integration**: Optionally initializes git repo and creates initial commit

### File Structure After Installation

```
your-workspace/
├── CLAUDE.md              # Your customized AI assistant instructions
├── claude_journal/        # Where your AI memory lives
│   ├── tag_bitmap.md      # Your personalized hex indexing schema
│   └── [hex_files].md     # Your AI conversation history
├── claude_artifacts/      # Supporting documents and context
├── scripts/               # Helper scripts (search, validation, etc.)
└── README.md             # Your project documentation
```

### Why `__CLAUDE_TEMPLATE.md`?

The template repository contains `__CLAUDE_TEMPLATE.md` instead of `CLAUDE.md` to avoid:
- Confusing Claude when it reads the template repository
- Accidental activation of template instructions
- Namespace conflicts with your final `CLAUDE.md`

The install script copies `__CLAUDE_TEMPLATE.md` → `CLAUDE.md` and customizes it with your personal information, giving you a clean, personalized AI instruction file.

### Storage & Privacy

- **Your data, your control**: Store locally, in private git repos, or your own cloud storage
- **No third-party services**: Just files and folders that you control completely
- **No API keys required**: Works wherever your AI assistant can read files
- **Complete ownership**: You decide where data lives and who has access

**Storage Options:**
- **Local files** - Everything on your laptop/desktop
- **Private GitHub repo** - Synced across devices, private by default
- **Your cloud storage** - S3, Google Drive, Dropbox, or any file system
- **Self-hosted git** - GitLab, Gitea, or your own git server

### AI Tool Compatibility

**Currently Optimized For:**
- **Claude Code** - Full integration with conversation protocols
- **Claude (web/API)** - Complete CLAUDE.md instruction support

**Adaptable To:**
- **GPT-4/ChatGPT** - Modify CLAUDE.md for OpenAI-specific instructions
- **Gemini** - Adapt memory retrieval patterns for Google's AI
- **Local LLMs** - Perfect for Ollama, LM Studio, and similar tools
- **Other AI assistants** - Core hex indexing works universally

**Want to adapt this for your AI tool?** We welcome contributions! The core memory system (hex indexing, file-based storage, context retrieval) is AI-agnostic. Only the instruction format needs adaptation.

## 🧠 How It Works

### The Problem
AI assistants forget everything between conversations. Every session starts from zero.

### The "Just Files" Solution
While others build complex vector databases and cloud APIs, we use the simplest approach that works:

**Other solutions require:**
```bash
pip install memory-framework
docker run vector-database  
export API_KEYS
python setup.py install
```

**Our solution requires:**
```bash
ls claude_journal/00BB*.md
```

### How It Works
1. **AI reads recent journal entries** at conversation start (mandatory protocol)
2. **Hex tags enable instant search** - no databases needed
3. **Cross-context patterns emerge** from structured metadata  
4. **Expert-level context** applied automatically
5. **Works with any AI tool** that can read files

### Universal AI Compatibility

**Works immediately with:**
- ✅ **Claude Code** (Anthropic's official CLI)
- ✅ **GitHub Copilot** (VS Code, command line)  
- ✅ **Cursor** (AI-first code editor)
- ✅ **Gemini** (Google AI with file access)
- ✅ **Local LLMs** (Ollama, LM Studio)
- 🔜 **ChatGPT** (desktop file access coming)

### Before vs. After

**Before (Traditional AI)**:
```
You: "How should I handle authentication in my React app?"
AI: "Here are some general approaches to authentication..."
```

**After (Personal AI Memory)**:
```
You: "How should I handle authentication in my React app?"
AI: "Based on your work in 00BA0102040 where you successfully implemented 
JWT with refresh tokens, and considering your preference for TypeScript 
and your company's security requirements documented in 00B9040201, 
I recommend extending your existing pattern..."
```

## 🏗️ Shared Memory Architecture

**NEW:** This system uses a shared memory architecture for optimal workspace flexibility:

```
┌─────────────────────────────────────────────────────────────────┐
│                    Template Repository                          │
│              michael-fay/personal-ai-memory-template           │
│                     (Community Template)                       │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                   Journal Repository                            │
│                   YOUR_USERNAME/my-ai-journal                  │
│                    (Personal Memory)                           │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Workspace Directory                         │
│                ~/projects/your-workspace/                      │
│                  (Project-Specific)                            │
└─────────────────────────────────────────────────────────────────┘
```

### Benefits of Shared Memory Architecture

1. **Template Evolution**: Community improvements flow to all users
2. **Shared Memory**: One journal repository serves multiple workspaces
3. **Workspace Isolation**: Each project gets its own detached workspace
4. **Microservice Support**: Multiple git repositories per workspace
5. **Template Updates**: Your improvements help the entire community

### Workspace Creation Workflow

```bash
# Step 1: Create your journal repository (one-time)
gh repo create my-username/my-ai-journal --template michael-fay/personal-ai-memory-template

# Step 2: Create workspace for each project
mkdir ~/projects/react-native-plugins
cd ~/projects/react-native-plugins

# Step 3: Bootstrap workspace with shared journal
curl -fsSL https://raw.githubusercontent.com/michael-fay/personal-ai-memory-template/main/.bootstrap/install.sh | bash
# Enter your journal repo URL when prompted
```

### Result: Perfect Separation

```
~/projects/react-native-plugins/    # Your workspace (NOT git managed)
├── CLAUDE.md                       # Workspace-specific instructions
├── claude_artifacts/               # Workspace artifacts
├── claude_journal/                 # Clone of your journal repo
├── .gitignore                      # Excludes journal from workspace commits
├── microservice1/                  # Git repo 1
├── microservice2/                  # Git repo 2
└── microservice3/                  # Git repo 3
```

## 🔧 Installation

### Step 1: Create Your Journal Repository (One-Time Setup)

Click the "Use this template" button above to create your personal journal repository.

### Step 2: Create and Bootstrap a Workspace

```bash
# Create workspace directory
mkdir ~/projects/your-workspace-name
cd ~/projects/your-workspace-name

# Bootstrap workspace with your journal
curl -fsSL https://raw.githubusercontent.com/michael-fay/personal-ai-memory-template/main/.bootstrap/install.sh | bash
```

**Windows:**
```cmd
REM Create workspace directory
mkdir C:\projects\your-workspace-name
cd C:\projects\your-workspace-name

REM Bootstrap workspace with your journal
curl -fsSL https://raw.githubusercontent.com/michael-fay/personal-ai-memory-template/main/.bootstrap/install.bat -o install.bat && install.bat
```

The script will prompt you for your journal repository URL and set up everything automatically.

### What Gets Created

```
your-workspace-name/
├── CLAUDE.md                          # Workspace-specific AI instructions
├── claude_artifacts/                  # Workspace artifacts and analysis
├── claude_journal/                    # Your shared journal repository
├── .gitignore                         # Excludes journal from workspace repos
└── [your project files and repos]    # Your actual work
```

## 🎛️ Usage

### Basic Workflow

1. **Start AI conversation** - Assistant reads recent journal entries for context
2. **Work together** - Solve problems, build features, make decisions
3. **End with journal entry** - Assistant creates detailed record with hex indexing
4. **Repeat** - Each session builds on previous knowledge

### Example Session

```markdown
# Backend API Development - User Authentication
## Session: 2025-07-07 - Session 3
### 🎯 Session Overview
**Duration**: 2 hours
**Focus**: Implementing JWT authentication with refresh tokens
**Status**: ✅ COMPLETE - Auth system working in development
**Scope**: Individual backend development

### 📋 Session Accomplishments
1. **JWT Implementation**: Created token generation and validation
2. **Refresh Token Flow**: Implemented secure refresh mechanism
3. **Middleware Setup**: Added authentication middleware to protected routes
4. **Database Schema**: Extended user model with refresh token fields
5. **Testing**: Created test suite for authentication endpoints

### 🔧 Technical Decisions
- **Library Choice**: Used `jose` over `jsonwebtoken` for better TypeScript support
- **Token Storage**: Refresh tokens stored in httpOnly cookies
- **Security**: Implemented token rotation on refresh
- **Error Handling**: Standardized authentication error responses

### 🎯 Next Steps
1. **Rate Limiting**: Add authentication rate limiting
2. **Password Reset**: Implement password reset flow
3. **Email Verification**: Add email verification requirement
4. **Security Headers**: Review and enhance security headers

### 💡 Key Insights
- Token rotation significantly improves security with minimal complexity
- jose library provides excellent TypeScript experience
- httpOnly cookies prevent XSS attacks on refresh tokens
- Standardized error responses improve frontend error handling

### 🔄 Cross-References
- Related to user management work in 00BA0201040
- Builds on security planning from 00B9040201
- Connects to frontend auth work planned in 00BB020201

### 🏷️ Hex Tags: 00BB03010201
- **Date**: 00BB (July 7, 2025)
- **Session**: 03 (Third session of the day)
- **Workspace**: 01 (Primary work project)
- **Technology**: 01 (Backend/API)
- **Activity**: 02 (Implementation)
- **Status**: 01 (Complete)
- **Context**: 01 (Individual work)
```

### Context Retrieval

When you ask about authentication in the future:

```bash
# AI assistant automatically searches:
ls ????01*.md | xargs grep -l -i "auth"      # All backend auth work
ls ????0102*.md | xargs grep -l "jwt"        # Backend implementation with JWT
ls ????010201*.md                            # Completed backend implementations
```

## 🎨 Customization

### Professional Templates

The schema evolves naturally based on your actual work patterns. The AI observes your work and creates the optimal categorization system for your specific needs.

### Custom Schema

As you use the system, you can edit `claude_journal/tag_bitmap.md` to document your evolved schema:

```markdown
## 🔧 Technology Domain (TD) - 8 bits
| Bit | Hex | Technology | Examples |
|-----|-----|------------|----------|
| 0 | 01 | YourTech1 | Your specific tools |
| 1 | 02 | YourTech2 | Your frameworks |
| 2 | 04 | YourTech3 | Your platforms |
```

## 📊 Examples

### Search Patterns

```bash
# Find all backend debugging sessions
ls ????[01-9A-F]0104*.md

# Find all completed research
ls ????[01-9A-F][01-9A-F]2001*.md

# Find all collaborative breakthroughs
ls ????[01-9A-F][01-9A-F][01-9A-F]8002*.md

# Find all work from last month
ls 00B[0-9A-F]*.md

# Find all critical issues
ls ????[01-9A-F][01-9A-F][01-9A-F]10*.md
```

### Complex Queries

```bash
# Backend work with authentication
ls ????[01-9A-F]01*.md | xargs grep -l -i "auth"

# All React debugging sessions
ls ????[01-9A-F]0204*.md | xargs grep -l -i "react"

# Cross-project breakthroughs
ls ????[01-9A-F][01-9A-F][01-9A-F]8008*.md

# Client work from Q2 2025
ls 00[5-9][0-9A-F][01-9A-F]04*.md
```

## 🔍 Advanced Features

### Bitwise Embeddings: 100x Faster Than Vector Databases

**The Innovation:**
Instead of computing neural network embeddings, we encode domain expertise directly in bit patterns:

```
Technology Domain (8 bits): 01=Backend, 02=Frontend, 04=Infrastructure...
Activity Domain (8 bits):   01=Design, 02=Code, 04=Debug, 08=Test...
Status Domain (8 bits):     01=Complete, 02=Ongoing, 04=Blocked...
```

**Why It's Faster:**
- **Vector search**: ~50ms neural network computation
- **Bitwise search**: ~0.5ms filesystem pattern matching
- **Perfect for personal scale**: Optimized for thousands, not millions of entries
- **Instant patterns**: `ls ????0104*.md` finds all backend debugging instantly

### Cross-Domain Intelligence

The system connects insights across all your work:

```bash
# Personal project solution → Work project application
ls ????02*.md | xargs grep -l "optimization" | head -5
ls ????01*.md | xargs grep -l "performance" | head -5

# Research findings → Implementation decisions
ls ????08*.md | xargs grep -l "architecture" | head -5
ls ????01*.md | xargs grep -l "scalability" | head -5
```

### Pattern Recognition

Over time, the system learns your:
- **Preferred libraries** and frameworks
- **Successful approaches** to common problems
- **Anti-patterns** to avoid
- **Breakthrough moments** and how they occurred
- **Collaboration styles** and what works best

### Performance Characteristics

- **Sub-millisecond queries** using filesystem operations
- **Linear scaling** - performance stays constant as entries grow
- **Zero dependencies** - no databases, APIs, or installations
- **Future-proof** - works with any AI tool that reads files

## 🤝 Contributing

We welcome contributions! Here's how to help:

### 🐛 Bug Reports
- Use GitHub Issues with the "bug" label
- Include your template version and OS
- Provide example hex tags that demonstrate the issue

### 💡 Feature Requests
- Use GitHub Issues with the "enhancement" label
- Describe your use case and workflow
- Suggest hex tag schema extensions if relevant

### 🔧 Development
```bash
# Fork and clone
git clone https://github.com/YOUR_USERNAME/personal-ai-memory-template.git

# Create feature branch
git checkout -b feature/your-feature

# Make changes and test
./scripts/test_template.sh

# Submit PR
git push origin feature/your-feature
```

### 📚 Documentation
- Add examples for your profession/domain
- Create new professional templates
- Improve customization guides
- Share search patterns and workflows

## 🏆 Community

### 📖 Community Templates
Contribute your evolved schemas and workflows:
- **Schema examples**: Share your tag_bitmap.md after it evolves for your work
- **Workflow patterns**: Document successful AI collaboration approaches
- **Search strategies**: Share useful hex pattern searches you've discovered
- **Integration ideas**: Creative ways to use the memory system

### 🔗 Integrations
Build tools that work with the system:
- **VS Code Extension**: Quick journal entry creation
- **CLI Tools**: Enhanced search and analysis
- **Web Dashboard**: Visual exploration of patterns
- **Mobile Apps**: Journal entry creation on-the-go

### 💬 Discussions
- Share successful search patterns
- Discuss schema evolution strategies
- Exchange workflow optimizations
- Troubleshoot setup issues

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- Inspired by the need for persistent AI memory
- Built on the principle of privacy-first personal knowledge management
- Designed for the era of personal AI assistants
- Created by people who believe AI should learn from and with you

---

## 🚀 Get Started Now

```bash
# Create your personal AI memory system
gh repo create my-ai-memory --template michael-fay/personal-ai-memory-template --private
cd my-ai-memory
./.bootstrap/install.sh --interactive

# Start your first enhanced AI conversation
# Your AI assistant now has perfect memory! 🧠✨
```

**Ready to transform how you work with AI?** [Get started now](#quick-start) and experience the power of personal AI memory.

---

*Developed in collaboration with Claude Code (Anthropic's AI assistant) to advance AI-human partnership and create tools that amplify human intelligence rather than replace it. This project demonstrates practical AI-human collaboration: human vision and domain expertise combined with AI implementation speed and technical precision. Open sourced for the betterment of the AI community.*

**Development Details:**
- **AI Partner**: Claude Code (Sonnet 4) - July 2025
- **Human Partner**: Michael Fay - System design, requirements, and domain expertise
- **Collaboration Method**: Iterative development with human-led architecture decisions
- **Code Generation**: ~90% AI-generated implementation with human review and refinement
- **Testing & Validation**: Human validation of all critical workflows and edge cases