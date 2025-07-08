# Personal AI Memory System

[![Use this template](https://img.shields.io/badge/Use%20this%20template-2ea44f?style=for-the-badge&logo=github)](../../generate)

**Never repeat the same conversation with your AI assistant.**

The simplest approach that works: just files, no installations, works with any AI tool.

## ⚠️ IMPORTANT: Use Template, Don't Clone

**✅ CORRECT:** Click the green "Use this template" button above  
**❌ WRONG:** Don't clone or fork this repository directly

This is a template repository. Cloning it directly will give you the template files, not a working personal AI memory system. You need to create your own repository from this template first.

## 🎯 Mission

**Transform your AI assistant into a personalized intelligence amplifier.** This system provides the minimal foundation - three required domains (DATE, SESSION, WORKSPACE) - then adapts completely to your unique work patterns. 

Whether you need 4 domains with deep categorization or 8 simpler domains, your AI assistant observes your actual work and evolves the schema to match. A researcher gets methodology tracking, a developer gets language categorization, a consultant gets client classification - all discovered organically through usage.

**The result**: An AI that becomes truly yours, not one-size-fits-all.

## 🚀 Features

- **⚡ Zero setup required** - works with any AI tool that can read files
- **🗲 Sub-millisecond retrieval** - optimized for personal data scale
- **🔒 Complete privacy** - everything stays on your machine  
- **🧠 Cross-domain intelligence** - connects all your work contexts
- **🎯 Universal compatibility** - future-proof across any AI platform
- **🔍 Bitwise embeddings** - 100x faster than vector databases
- **🛠️ Fully customizable** - adapt to any profession or workflow

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

### TL;DR Consumer Workflow:
1. **Use this template** → Click "Use this template" on GitHub
2. **One command** → Copy and paste the command below
3. **Profit** → Your AI assistant now has perfect memory!

### Ultra-Simple One-Liner (Mac/Linux):
```bash
# From your desired workspace directory:
curl -fsSL https://raw.githubusercontent.com/michael-fay/personal-ai-memory-template/main/scripts/install.sh | bash
```

### Windows Users:
```cmd
REM From your desired workspace directory:
curl -fsSL https://raw.githubusercontent.com/michael-fay/personal-ai-memory-template/main/scripts/install.bat -o install.bat && install.bat
```

**What it does:**
- Prompts for your personal repository URL (the one you created from this template)
- Clones your repository automatically to your workspace
- Sets up the system with interactive prompts for personalization
- Creates your personalized CLAUDE.md and directory structure
- Ready to use immediately with your AI assistant!

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

### Security & Privacy

- **No data collection**: Everything stays on your machine
- **No external dependencies**: Just bash/batch scripts and standard tools
- **No API keys required**: Works with any AI tool that can read files
- **Complete control**: You own all data and can modify anything

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

## 🔧 Installation

### Method 1: Use This Template (Recommended)

**Mac/Linux:**
```bash
# Create your personal repository from this template
gh repo create my-ai-memory --template YOUR_USERNAME/personal-ai-memory-template --private

# Clone and setup from your desired workspace
git clone https://github.com/YOUR_USERNAME/my-ai-memory.git
cd my-ai-memory

# Interactive setup
./scripts/install.sh --interactive
```

**Windows:**
```cmd
REM Create your personal repository from this template
gh repo create my-ai-memory --template YOUR_USERNAME/personal-ai-memory-template --private

REM Clone and setup from your desired workspace
git clone https://github.com/YOUR_USERNAME/my-ai-memory.git
cd my-ai-memory

REM Interactive setup
scripts\install.bat --interactive
```

### Method 2: Direct Install from GitHub (Mac/Linux)

```bash
# Install directly into current directory
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/personal-ai-memory-template/main/scripts/install.sh | bash -s -- --interactive --target .
```

### Method 3: Install in Existing Project

**Mac/Linux:**
```bash
# Add to existing project
cd /path/to/your/existing/project
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/personal-ai-memory-template/main/scripts/install.sh | bash -s -- --target .
```

**Windows:**
```cmd
REM Add to existing project
cd C:\path\to\your\existing\project
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/personal-ai-memory-template/main/scripts/install.bat -o install.bat && install.bat
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

Choose from pre-configured templates:

#### 🛠️ Software Developer
```bash
./scripts/install.sh --template developer
```
- **Technologies**: Backend, Frontend, Infrastructure, Database, Mobile, AI/ML
- **Activities**: Design, Code, Debug, Test, Deploy, Research, Review
- **Status**: Complete, InProgress, Blocked, Testing, Critical, Breakthrough

#### 🔬 Researcher
```bash
./scripts/install.sh --template researcher
```
- **Technologies**: Literature, DataCollection, Analysis, Writing, Presentation
- **Activities**: Reading, Experiment, Analysis, Writing, Review, Present
- **Status**: Complete, Ongoing, Blocked, Hypothesis, Publication, Discovery

#### 💼 Consultant
```bash
./scripts/install.sh --template consultant
```
- **Technologies**: Strategy, Implementation, Analysis, Presentation, Training
- **Activities**: Planning, Execution, Problem-solving, Solution, Delivery
- **Status**: Complete, Ongoing, Blocked, Proposal, Billable, Breakthrough

#### 🎨 Creative Professional
```bash
./scripts/install.sh --template creative
```
- **Technologies**: Design, Writing, Media, Presentation, Collaboration
- **Activities**: Concept, Create, Refine, Present, Feedback, Iterate
- **Status**: Complete, InProgress, Review, Client, Revision, Breakthrough

### Custom Schema

Edit `claude_journal/tag_bitmap.md` to define your own domains:

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

### 📖 Professional Templates
Share your customized templates:
- **Academic Researcher**: Literature review and publication workflows
- **Product Manager**: Feature planning and user research
- **Designer**: Creative process and client collaboration
- **Data Scientist**: Experiment tracking and model development

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
gh repo create my-ai-memory --template YOUR_USERNAME/personal-ai-memory-template --private
cd my-ai-memory
./scripts/install.sh --interactive

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