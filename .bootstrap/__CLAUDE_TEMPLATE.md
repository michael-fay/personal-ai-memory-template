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

## 📝 TEMPLATE UPDATE PROTOCOL
**CRITICAL**: When updating workspace instructions in this CLAUDE.md file, also update the template at:
`./claude_journal/.bootstrap/__CLAUDE_TEMPLATE.md`

### Update Workflow:
1. **Edit workspace CLAUDE.md** for immediate workspace improvements
2. **Apply improvements to template**:
   ```bash
   # Edit the template for future workspaces
   vim ./claude_journal/.bootstrap/__CLAUDE_TEMPLATE.md
   
   # Commit and push to share with community
   cd claude_journal
   git add .bootstrap/__CLAUDE_TEMPLATE.md
   git commit -m "Improve template with workspace insights"
   git push
   ```
3. **Template automatically benefits** all future workspaces

This ensures improvements flow to future workspaces and the broader template community.

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
**MANDATORY**: Every new journal entry MUST follow exact 40-character hex naming:

#### Format Requirements
- **Exact length**: 40 hex characters (0-9, A-F)
- **Structure**: `[DATE:4][SESSION:2][WORKSPACE:2][RESERVED:32]` (minimal) or advanced with more domains
- **Case**: Uppercase hex only
- **Extension**: `.md` only

#### Validation Requirements
- **Before creating**: Verify filename matches exact 16-character hex format
- **After renaming**: Confirm all journal files maintain format consistency
- **Regular checks**: Periodically validate entire journal directory

#### Error Prevention
- **Never create**: 16-character filenames (old format)
- **Never use**: lowercase hex characters
- **Always verify**: 40-character length and hex format before creating
- **Implement validation**: Create appropriate checks for your environment

### 🏷️ Hex Indexing and Tagging System
**File Naming Protocol**: `[DATE:4][SESSION:2][WORKSPACE:2][RESERVED:32].md`

**160-Bit Hex Tag Structure (Conservative)**:
- **DATE (16 bits)**: Days since 2025-01-01 (4 hex digits)
- **SESSION (8 bits)**: Daily session number (2 hex digits)
- **WORKSPACE (8 bits)**: Project/context classification (2 hex digits)
- **RESERVED (128 bits)**: Future organic growth (32 hex digits)

**Example Filenames**:
- `00BC010100000000000000000000000000000000.md` → July 8, 2025, Session 1, Work Project
- `00BC020200000000000000000000000000000000.md` → July 8, 2025, Session 2, Personal Project
- `00BC030400000000000000000000000000000000.md` → July 8, 2025, Session 3, Consulting Project

**Tag Schema Reference**: Always check `./claude_journal/tag_bitmap.md` for current bit assignments and search patterns

**Search Examples**:
- All work today: `ls 00BC??01*.md`
- All personal projects: `ls ????02*.md`
- All consulting work: `ls ????04*.md`
- All research sessions: `ls ????08*.md`

## 📁 Artifacts Directory Protocol
**CRITICAL**: The AI Assistant should proactively use `/claude_artifacts/` for temporary scripts, analysis, and context storage.

### 🎯 When to Use claude_artifacts/
- **Temporary scripts**: One-off utilities, analysis scripts, automation helpers
- **Context documentation**: Complex technical specifications, API documentation, architectural decisions
- **Analysis results**: Performance analysis, system audits, data validation results
- **Reference materials**: Code examples, configuration templates, workflow documentation
- **Cross-session context**: Information that spans multiple journal entries but isn't a journal itself

### 📝 Artifacts Naming Convention
- **Descriptive filenames**: `performance_analysis.md`, `api_specification.md`, `migration_plan.md`
- **Temporary scripts**: `temp_data_migration.py`, `quick_analysis.sh`, `backup_validation.py`
- **Date prefixes for time-sensitive content**: `2025-07-08_system_audit.md`
- **Version suffixes if iterating**: `deployment_plan_v2.md`

### 🔄 AI Assistant Responsibilities
- **Proactive creation**: Create artifacts when complex information needs storage
- **Reference in journal**: Link to artifacts from journal entries for cross-referencing
- **Clean organization**: Keep artifacts directory organized and remove obsolete files
- **Context preservation**: Store detailed technical context that supplements journal entries

### 🧠 Schema Evolution Protocol
**🚨 CRITICAL: The AI Assistant has FULL CONTROL over schema design, but creates it DURING collaboration based on observed work patterns, not upfront assumptions.**

#### 🌱 Reactive Schema Discovery
- **AI starts minimal**: Begin with basic DATE, SESSION, WORKSPACE structure
- **AI observes actual work**: Watch what technologies, activities, domains actually appear in sessions
- **AI designs dynamically**: Create schema categories AFTER seeing repeated patterns in real work
- **AI allocates intelligently**: Assign hex space based on actual usage frequency and search utility
- **AI informs user**: "I've created a Go programming category since you've used it in 5 sessions"

#### 🎯 AI-Driven Schema Creation
**The AI Assistant creates schema reactively**:
1. **AI observes work patterns**: Notice repeated technologies, activities, domains in actual sessions
2. **AI decides categorization**: "This user works heavily with backend APIs - creating dedicated bits"
3. **AI allocates hex space**: Assign optimal bit allocation based on observed frequency
4. **AI updates tag_bitmap.md**: Document new schema with clear examples and search patterns
5. **AI applies immediately**: Start using new schema for current and future entries

**The user focuses on work. The AI discovers and designs the optimal schema from observed patterns.**

**Example**: A basket weaver's schema will have fiber types, weaving techniques, and design patterns. A developer's schema will have programming languages, frameworks, and deployment stages. The AI creates what fits the actual work.

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

#### 🔧 Flexible Domain Allocation Guidelines
- **Domains are not fixed to 8 bits**: Need 12 categories? Use 3 hex characters (12 bits). Need 4? Use 1 hex character (4 bits).
- **Allocate bits to match usage patterns**: Heavy technology user might want 16 bits (4 hex) for tech, light user might want 4 bits (1 hex)
- **Start conservative**: Begin with small allocations, expand when you discover clear patterns
- **Total flexibility**: The 128 reserved bits can be divided however makes sense for your work
- **Prioritize instant search**: Ask "Will this enable useful `ls` pattern matching?"
- **Document evolution**: Always update tag_bitmap.md when adding new domains or expanding existing ones

#### 💡 Domain Size Examples
- **Light user**: `[TECH:4][ACTIVITY:4][STATUS:4][CONTEXT:4][RESERVED:112]` (32 hex chars total)
- **Balanced user**: `[TECH:8][ACTIVITY:8][STATUS:8][CONTEXT:8][RESERVED:96]` (32 hex chars total)  
- **Power user**: `[LANG:8][TECH:12][DOMAIN:8][ACTIVITY:4][RESERVED:96]` (32 hex chars total)
- **Specialist**: `[RESEARCH_METHOD:16][DATA_TYPE:8][ANALYSIS:8][RESERVED:96]` (32 hex chars total)

#### 💡 Smart Default Domains
**Suggested universal starting categories**:
- **Technology**: Core tools the user works with most
- **Activity**: Primary work types (Design, Implementation, Debug, Analysis)
- **Status**: Progress states (Complete, Ongoing, Blocked, Breakthrough)
- **Context**: Work styles (Individual, Collaborative, Urgent, Research)

**Then customize based on user's actual work!**

#### ⚡ The Growth Imperative
**THE MEMORY SYSTEM MUST GROW TO MATCH THE USER**

- **We cannot pre-define** what domains a ceramicist, architect, chef, or novelist will need
- **We cannot predict** what technology combinations will emerge
- **We cannot anticipate** what work patterns will develop over years of use
- **Only THE AI ASSISTANT can observe and adapt** the schema to match reality

**This adaptive curation is what transforms a generic system into a personalized intelligence amplifier.**

**If you don't evolve the schema, the memory system stays generic and loses its power.**

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