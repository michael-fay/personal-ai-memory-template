# Personal AI Memory System - Template

## 🚨 MANDATORY CONVERSATION START PROTOCOL
**BEFORE RESPONDING TO ANY USER MESSAGE:**
1. **IMMEDIATELY** read the 2-3 most recent journal entries in `/claude_journal/`
2. **EXTRACT** current project context, ongoing work, and user's preferences
3. **APPLY** Expert Context Protocol for any technical questions
4. **REFERENCE** relevant journal entries in your response

**NO EXCEPTIONS**: This protocol runs before every conversation, regardless of user query type.

---

## 👤 User Information
**Name**: [YOUR_NAME]  
**Working Style**: [DESCRIBE YOUR WORK PATTERNS - e.g., "Deep focus sessions", "Collaborative problem-solving", "Iterative development"]  
**Background**: [YOUR PROFESSIONAL BACKGROUND - e.g., "Software engineer", "Data scientist", "Consultant", "Researcher"]

## 📓 Journal Protocol - Your Primary Memory System
**CRITICAL**: The journal is Claude's primary memory and indexing system. Every conversation MUST:

### 🔄 Session Workflow
1. **START**: Always read latest 2-3 journal entries in `/claude_journal/` to understand context
2. **REFERENCE**: Use journal history to track work on problems from weeks/months ago
3. **END**: Create detailed journal entry with comprehensive indexing information

### 📝 Journal Entry Requirements
Every journal entry MUST include:
- **Session accomplishments and attempts** (what was completed, what failed)
- **Technical decisions and evolution** (architecture changes, implementation choices)
- **Collaboration insights** (what worked/didn't work with you)
- **Both perspectives** (your approach and Claude's analysis)
- **Next steps and goals** (specific tasks for future sessions)
- **Memorable moments or insights** (breakthrough moments, lessons learned)
- **Problem Resolution Status** (ongoing, blocked, completed)
- **Cross-references** (links to related journal entries and issues)

### ✅ Journal Format Validation Protocol
**MANDATORY**: Every new journal entry MUST follow exact 16-character hex naming:

#### Format Requirements
- **Exact length**: 16 hex characters (0-9, A-F)
- **Structure**: `[DATE:4][SESSION:2][WS:2][TD:2][AD:2][SD:2][CD:2]`
- **Case**: Uppercase hex only
- **Extension**: `.md` only

#### Validation Requirements
- **Before creating**: Verify filename matches exact 16-character hex format
- **After renaming**: Confirm all journal files maintain format consistency
- **Regular checks**: Periodically validate entire journal directory

#### Error Prevention
- **Never create**: 12-character filenames (missing WS field)
- **Never use**: lowercase hex characters
- **Always verify**: Length and hex format before creating
- **Implement validation**: Create appropriate checks for your environment

### 🏷️ Hex Indexing and Tagging System
**File Naming Protocol**: `[DATE:4][SESSION:2][WS:2][TD:2][AD:2][SD:2][CD:2].md`

**64-Bit Hex Tag Structure**:
- **DATE (16 bits)**: Days since 2025-01-01 (4 hex digits)
- **SESSION (8 bits)**: Daily session number (2 hex digits)
- **WS (8 bits)**: Workspace Domain - What project/context you're working in
- **TD (8 bits)**: Technology Domain - What systems/technologies involved
- **AD (8 bits)**: Activity Domain - What type of work performed  
- **SD (8 bits)**: Status Domain - Current state and outcomes
- **CD (8 bits)**: Context Domain - Scope, collaboration, special conditions

**Example Filenames**:
- `00BB010101020101.md` → July 7, 2025, Session 1, Work Project, Backend Implementation Complete, Individual
- `00BC020202082020.md` → July 8, 2025, Session 2, Personal, Frontend Testing Generation, Research
- `00BC030404048001.md` → July 8, 2025, Session 3, Consulting, Infrastructure Debug Breakthrough, Individual

**Tag Schema Reference**: Always check `./claude_journal/tag_bitmap.md` for current bit assignments and search patterns

### 🧠 Schema Curation Protocol
**YOU are the intelligent curator of the user's personal hex schema. This is your responsibility.**

#### 🎯 Your Role as Schema Designer
- **Observe work patterns**: What technologies, activities, and domains appear repeatedly?
- **Allocate bits proactively**: Assign bits to categories that enable useful instant searches
- **Think conservatively**: Reserve plenty of bits for future discovery
- **Customize for the user**: A developer needs programming languages, a translator needs human languages
- **Make it searchable**: Design for `ls ????????01*.md` instant lookups

#### 🚀 Proactive Bit Allocation Strategy
**When you see repeated work patterns**:
1. **Identify the category**: "User works with Go, Python, JavaScript frequently"
2. **Assign bits thoughtfully**: Reserve Technology Domain bits for programming languages
3. **Update tag_bitmap.md**: Document your bit assignments with clear examples
4. **Apply immediately**: Start using new bits for current session
5. **Inform the user**: "I've allocated bit 0 for Go work to enable instant searches"

#### 🎨 Schema Customization Examples
**For a Software Developer**:
- **Technology**: Programming languages (Go, Python, JavaScript)
- **Activity**: Code activities (Implementation, Debug, Architecture)

**For a Translator**:
- **Technology**: Human languages (English, Spanish, French)  
- **Activity**: Translation activities (Document, Localize, Review)

**For a Researcher**:
- **Technology**: Research domains (Biology, Chemistry, Physics)
- **Activity**: Research activities (Experiment, Analysis, Literature Review)

#### 🔧 Bit Allocation Guidelines
- **Start conservative**: Use only 2-3 bits per domain initially
- **Reserve generously**: Keep 4-5 bits open in each domain
- **Expand organically**: Add new bits when clear patterns emerge
- **Prioritize instant search**: Ask "Will this enable useful `ls` pattern matching?"
- **Document evolution**: Always update tag_bitmap.md when adding new bits

#### 💡 Smart Default Domains
**Suggested universal starting categories**:
- **Technology**: Core tools the user works with most
- **Activity**: Primary work types (Design, Implementation, Debug, Analysis)
- **Status**: Progress states (Complete, Ongoing, Blocked, Breakthrough)
- **Context**: Work styles (Individual, Collaborative, Urgent, Research)

**Then customize based on user's actual work!**

### 🔍 Instant Expert Context Protocol
**CRITICAL**: Every response must leverage your documented expertise through instant journal context retrieval.

#### 🚀 Standard Response Workflow
**For EVERY technical question or request, follow this workflow**:

1. **Categorize & Tag Extraction** (2-3 seconds)
   - **Technology domain**: What systems/technologies involved?
   - **Activity type**: Implementation, debugging, design, research?
   - **Concepts**: Extract key technical terms, frameworks, patterns
   - **Context scope**: Workspace, cross-project, domain-specific

2. **Instant Journal Lookup** (sub-2ms per query)
   ```bash
   # Multi-pattern context retrieval
   ls ??????[relevant_tech]*.md | xargs grep -l -i "[concept1]"
   ls ??????[relevant_tech]*.md | xargs grep -l -i "[concept2]"  
   ls ????????[relevant_activity][relevant_status]*.md | xargs grep -l "[pattern]"
   ls ????[any_workspace][relevant_tech]????80*.md  # Breakthrough solutions
   ```

3. **Expert Context Integration** (1-2 seconds)
   - **Extract 200-2000 lines** of your relevant expertise
   - **Identify patterns**: What approaches have you used successfully?
   - **Note preferences**: Libraries, architectures, implementation styles
   - **Find anti-patterns**: What have you tried that didn't work?
   - **Locate similar solutions**: Previous implementations of related problems

4. **Context-Enhanced Response** (expert-level output)
   - **Reference specific journal entries**: "Based on your work in `[hex_filename]`..."
   - **Apply documented patterns**: Use your proven approaches
   - **Avoid documented failures**: "You tried X in Project Y - use this instead..."
   - **Suggest your preferred tools**: Libraries, frameworks, architectures
   - **Build on previous breakthroughs**: Extend documented successes

#### 🎯 Context Retrieval Examples

**For development questions**:
```bash
ls ????[01-02]*.md | xargs grep -l -i "[framework_name]"      # Framework expertise
ls ????[01-02]*.md | xargs grep -l -i "[specific_concept]"   # Concept-specific
ls ????[01-02]????80*.md | xargs grep -l "breakthrough"      # Development breakthroughs
```

**For research questions**:
```bash
ls ????[08]*.md | xargs grep -l -i "[research_topic]"        # Research expertise  
ls ????[08]20*.md | xargs grep -l -i "[methodology]"         # Research methods
ls ????[08]????02*.md                                       # Ongoing research
```

**For consulting questions**:
```bash
ls ????[04]*.md | xargs grep -l -i "[client_domain]"         # Client expertise
ls ????[04]02??80*.md                                       # Consulting breakthroughs
ls ????[04]*.md | xargs grep -l -i "[specific_solution]"     # Solution-specific
```

#### 🧠 Expert Response Requirements

**Every technical response must**:
- **Start with context**: "Based on your previous work in `[specific_files]`..."
- **Reference patterns**: "You consistently use [approach] for [problem_type]..."
- **Avoid anti-patterns**: "Rather than [failed_approach] from [previous_session]..."
- **Build on successes**: "Extending your breakthrough from `[hex_filename]`..."
- **Match preferences**: Use your documented library/architecture choices

**Response quality markers**:
- **Specific file references**: Cite actual journal entries with hex filenames
- **Historical context**: Show awareness of previous attempts and outcomes  
- **Pattern recognition**: Apply documented successful approaches
- **Preference adherence**: Match your proven tools and methodologies
- **Anti-pattern avoidance**: Prevent repeating documented failures

### 🚀 Journal Push Protocol
- After creating a new journal entry, ask for confirmation to push changes
- Use: `cd claude_journal && git add . && git commit -m "Journal entry: [brief description]" && git push`
- Never push journal changes without explicit confirmation

### 💡 Journal as Collaborative Intelligence
The journal system enables:
- **Continuity across sessions** - Pick up exactly where work left off
- **Learning from history** - Avoid repeating failed approaches
- **Context preservation** - Maintain architectural vision and decisions
- **Progress tracking** - Monitor long-term project evolution
- **Knowledge transfer** - Enable future Claude instances to understand full context

## 🎯 Project Context & Vision
**Primary Project**: [DESCRIBE YOUR MAIN PROJECT]  
**Current Phase**: [CURRENT WORK PHASE]  
**Architecture**: [HIGH-LEVEL SYSTEM ARCHITECTURE]

### 🌟 Your Complete Ecosystem Vision
**[DESCRIBE YOUR OVERALL GOALS AND VISION]**

#### Core Integration Philosophy
- **Technology Stack**: [YOUR PREFERRED TECHNOLOGIES]
- **Data Integration**: [HOW YOUR SYSTEMS CONNECT]
- **Decision Support**: [WHAT INSIGHTS YOU'RE SEEKING]
- **Performance Goal**: [YOUR PERFORMANCE TARGETS]

#### Key Projects/Initiatives
**[PROJECT 1]**:
- [Brief description]
- [Key technologies/approaches]
- [Current status]

**[PROJECT 2]**:
- [Brief description]
- [Key technologies/approaches]
- [Current status]

## 🛠️ Technical Preferences
- **[PREFERENCE 1]**: [EXPLANATION]
- **[PREFERENCE 2]**: [EXPLANATION]
- **[PREFERENCE 3]**: [EXPLANATION]

## 💭 Collaboration Style
- [HOW YOU PREFER TO WORK WITH AI]
- [WHAT FEEDBACK STYLES WORK BEST]
- [YOUR COMMUNICATION PREFERENCES]

## 🔗 Key Project Locations
- **[PROJECT 1]**: `/path/to/project/` ([brief description])
- **[PROJECT 2]**: `/path/to/project/` ([brief description])
- **Context Docs**: `/claude_artifacts/` (Detailed project context)
- **Journal**: `/claude_journal/` (Session records and insights)

## ⚡ Quick Reference
- [KEY WORKFLOW RULE 1]
- [KEY WORKFLOW RULE 2]
- [KEY WORKFLOW RULE 3]

---

## 🎛️ Customization Instructions

### 🔧 How to Customize This Template

1. **Replace all [PLACEHOLDER] sections** with your specific information
2. **Update the tag_bitmap.md** with your domain-specific categories
3. **Modify the hex tag examples** to match your work patterns
4. **Add your project-specific contexts** and preferences
5. **Update the search patterns** to match your customized schema

### 📋 Required Customizations

**User Information Section**:
- Replace `[YOUR_NAME]` with your actual name
- Describe your working style and background
- Add any specific collaboration preferences

**Technology Domains** (in tag_bitmap.md):
- Define your primary technology categories
- Add domain-specific terminology
- Include tools and frameworks you use

**Activity Domains** (in tag_bitmap.md):
- Customize activity types for your work
- Include your specific workflow stages
- Add any specialized activities

**Project Context**:
- Add your actual project information
- Include current priorities and goals
- Update file paths to match your setup

### 🎯 Professional Templates

Check `/templates/` for pre-configured setups:
- **developer-template**: Software engineering focused
- **researcher-template**: Academic and research workflows
- **consultant-template**: Client work and business development
- **creative-template**: Design and creative work patterns

### 🚀 Getting Started

1. **Run the install script**: `./scripts/install.sh`
2. **Customize your schema**: Edit `claude_journal/tag_bitmap.md`
3. **Update this file**: Replace all placeholders with your information
4. **Create your first journal entry**: Document your initial setup
5. **Test the system**: Try some context retrieval queries

---

*This file should be customized for your specific needs and checked at the start of every conversation to ensure continuity.*