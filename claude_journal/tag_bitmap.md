# Hex Tag Bitmap Schema - Template
## Version 1.0 - Personal AI Memory System

### 🎯 64-Bit Journal Entry Structure
```
[DATE:16][SESSION:8][WORKSPACE:8][TD:8][AD:8][SD:8][CD:8]
└─Timestamp─┘└─Seq─┘└─Context─┘└─Tech─┘└─Activity─┘└─Status─┘└─Domain─┘
```

---

## 📅 Date Domain (16 bits)
**Epoch**: Days since 2025-01-01
**Range**: 0-65535 (179 years: 2025-2204)

| Value | Date | Hex |
|-------|------|-----|
| 0 | 2025-01-01 | 0000 |
| 187 | 2025-07-07 | 00BB |
| 365 | 2025-12-31 | 016D |
| 730 | 2026-12-31 | 02DA |

---

## 🔢 Session Domain (8 bits)
**Daily session counter**: 0-255
**Format**: Sequential numbering within each day

| Value | Session | Hex |
|-------|---------|-----|
| 0 | Session 0 | 00 |
| 1 | Session 1 | 01 |
| 8 | Session 8 | 08 |
| 255 | Session 255 | FF |

---

## 🏢 Workspace Domain (8 bits)
**Project/Context Classification**

| Bit | Hex | Workspace | Description |
|-----|-----|-----------|-------------|
| 0 | 01 | Work | Primary job/career projects |
| 1 | 02 | Personal | Personal projects and learning |
| 2 | 04 | Consulting | Client work, freelance projects |
| 3 | 08 | Research | Academic work, investigations |
| 4 | 10 | Creative | Design, writing, artistic work |
| 5 | 20 | **RESERVED** | Future workspace expansion |
| 6 | 40 | **RESERVED** | Future workspace expansion |
| 7 | 80 | **RESERVED** | Future workspace expansion |

**Multi-workspace**: Use bit combinations (01+02 = Work+Personal integration)

---

## 🔧 Technology Domain (TD) - 8 bits
**What systems/technologies were involved**

| Bit | Hex | Technology | Examples |
|-----|-----|------------|----------|
| 0 | 01 | Backend/API | Server development, databases, APIs |
| 1 | 02 | Frontend/UI | Web interfaces, mobile apps, user experience |
| 2 | 04 | Infrastructure | DevOps, cloud, deployment, monitoring |
| 3 | 08 | Data/Analytics | Data processing, machine learning, visualization |
| 4 | 10 | Mobile | iOS, Android, cross-platform development |
| 5 | 20 | Research | Academic tools, literature, methodology |
| 6 | 40 | Documentation | Writing, planning, specifications |
| 7 | 80 | **RESERVED** | Future technology categories |

---

## ⚡ Activity Domain (AD) - 8 bits  
**What type of work was performed**

| Bit | Hex | Activity | Examples |
|-----|-----|----------|----------|
| 0 | 01 | Design/Architecture | System design, planning, blueprints |
| 1 | 02 | Implementation | Writing code, building features |
| 2 | 04 | Debug/Troubleshoot | Fixing bugs, diagnosing issues |
| 3 | 08 | Testing/Validation | Running tests, verifying functionality |
| 4 | 10 | Deploy/Release | Deployment, production releases |
| 5 | 20 | Research/Investigation | Learning, exploring, proof of concepts |
| 6 | 40 | Analysis | Data analysis, pattern recognition |
| 7 | 80 | **RESERVED** | Future activity categories |

---

## 📊 Status Domain (SD) - 8 bits
**Current state and outcomes**

| Bit | Hex | Status | Examples |
|-----|-----|--------|----------|
| 0 | 01 | Complete/Success | Task finished successfully |
| 1 | 02 | Ongoing/In Progress | Work continuing, not yet finished |
| 2 | 04 | Blocked/Stuck | Waiting for resources, dependencies |
| 3 | 08 | Experimental | Testing new approaches, prototypes |
| 4 | 10 | Critical/High Priority | Urgent, high impact, time-sensitive |
| 5 | 20 | Learning/Training | Skill development, education |
| 6 | 40 | Review/Evaluation | Assessment, decision-making |
| 7 | 80 | Breakthrough/Discovery | Major insights, innovations |

---

## 🎯 Context Domain (CD) - 8 bits
**Scope, collaboration, and special conditions**

| Bit | Hex | Context | Examples |
|-----|-----|---------|----------|
| 0 | 01 | Individual | Solo work, independent research |
| 1 | 02 | Collaborative | Team work, pair programming |
| 2 | 04 | Deep Focus | Extended concentration sessions |
| 3 | 08 | Cross-Project | Affects multiple projects/domains |
| 4 | 10 | Meeting/Communication | Discussions, presentations |
| 5 | 20 | Client/External | Working with external stakeholders |
| 6 | 40 | **RESERVED** | Future context categories |
| 7 | 80 | **RESERVED** | Future context categories |

---

## 🔍 Search Pattern Examples

### Technology-Specific Searches
```bash
# All backend work
ls ????[01-9A-F]01*.md

# All frontend work  
ls ????[01-9A-F]02*.md

# All infrastructure work
ls ????[01-9A-F]04*.md

# All data/analytics work
ls ????[01-9A-F]08*.md
```

### Activity-Specific Searches
```bash
# All debugging sessions
ls ????[01-9A-F][01-9A-F]04*.md

# All research work
ls ????[01-9A-F][01-9A-F]20*.md

# All analysis work
ls ????[01-9A-F][01-9A-F]40*.md

# All implementation work
ls ????[01-9A-F][01-9A-F]02*.md
```

### Status-Specific Searches
```bash
# All completed work
ls ????[01-9A-F][01-9A-F][01-9A-F]01*.md

# All blocked work
ls ????[01-9A-F][01-9A-F][01-9A-F]04*.md

# All breakthroughs
ls ????[01-9A-F][01-9A-F][01-9A-F][01-9A-F]80*.md

# All experimental work
ls ????[01-9A-F][01-9A-F][01-9A-F]08*.md
```

### Context-Specific Searches  
```bash
# All collaborative work
ls ????[01-9A-F][01-9A-F][01-9A-F][01-9A-F]02*.md

# All deep focus sessions
ls ????[01-9A-F][01-9A-F][01-9A-F][01-9A-F]04*.md

# All cross-project work
ls ????[01-9A-F][01-9A-F][01-9A-F][01-9A-F]08*.md
```

### Complex Multi-Domain Searches
```bash
# All backend debugging (Technology + Activity)
ls ????[01-9A-F]0104*.md

# All completed research work (Activity + Status)
ls ????[01-9A-F][01-9A-F]2001*.md

# All collaborative breakthroughs (Context + Status)  
ls ????[01-9A-F][01-9A-F][01-9A-F]8002*.md

# All work project implementation
ls ????01[01-9A-F]02*.md
```

---

## 📈 Professional Template Variations

### 🛠️ Software Developer Template
```
Technology: 01=Backend, 02=Frontend, 04=Infrastructure, 08=Database, 10=Mobile, 20=AI/ML
Activity:   01=Design, 02=Code, 04=Debug, 08=Test, 10=Deploy, 20=Research, 40=Review
Status:     01=Complete, 02=InProgress, 04=Blocked, 08=Testing, 10=Critical, 80=Breakthrough
Context:    01=Solo, 02=Team, 04=Focus, 08=CrossTeam, 10=Meeting, 20=Client
```

### 🔬 Researcher Template
```
Technology: 01=Literature, 02=DataCollection, 04=Analysis, 08=Writing, 10=Presentation, 20=Collaboration
Activity:   01=Reading, 02=Experiment, 04=Analysis, 08=Writing, 10=Review, 20=Present, 40=Collaborate
Status:     01=Complete, 02=Ongoing, 04=Blocked, 08=Hypothesis, 10=Critical, 20=Publication, 80=Discovery
Context:    01=Individual, 02=Collaborative, 04=FieldWork, 08=Conference, 10=Teaching, 20=Grant
```

### 💼 Consultant Template
```
Technology: 01=Strategy, 02=Implementation, 04=Analysis, 08=Presentation, 10=Training, 20=Process
Activity:   01=Planning, 02=Execution, 04=Problem, 08=Solution, 10=Delivery, 20=Follow-up
Status:     01=Complete, 02=Ongoing, 04=Blocked, 08=Proposal, 10=Critical, 20=Billable, 80=Breakthrough
Context:    01=Internal, 02=Client, 04=Team, 08=Stakeholder, 10=Meeting, 20=Travel
```

---

## 🛠️ Customization Guide

### 🔧 How to Customize Your Schema

1. **Identify Your Core Technologies**
   - List the main tools, languages, and systems you work with
   - Group them into 6-8 major categories
   - Assign hex bits based on frequency of use

2. **Define Your Activity Types**
   - Map your typical workflow stages
   - Include both routine and special activities
   - Consider your problem-solving approaches

3. **Categorize Your Work States**
   - How do you track progress?
   - What blocking conditions do you encounter?
   - What breakthrough moments matter to you?

4. **Map Your Work Contexts**
   - Individual vs. collaborative work
   - Different types of collaboration
   - Special working conditions or environments

### 📝 Customization Worksheet

**Your Technology Domains** (replace the examples):
- Bit 0 (01): _________________
- Bit 1 (02): _________________
- Bit 2 (04): _________________
- Bit 3 (08): _________________
- Bit 4 (10): _________________
- Bit 5 (20): _________________
- Bit 6 (40): _________________
- Bit 7 (80): _________________

**Your Activity Domains** (replace the examples):
- Bit 0 (01): _________________
- Bit 1 (02): _________________
- Bit 2 (04): _________________
- Bit 3 (08): _________________
- Bit 4 (10): _________________
- Bit 5 (20): _________________
- Bit 6 (40): _________________
- Bit 7 (80): _________________

**Your Status Domains** (replace the examples):
- Bit 0 (01): _________________
- Bit 1 (02): _________________
- Bit 2 (04): _________________
- Bit 3 (08): _________________
- Bit 4 (10): _________________
- Bit 5 (20): _________________
- Bit 6 (40): _________________
- Bit 7 (80): _________________

**Your Context Domains** (replace the examples):
- Bit 0 (01): _________________
- Bit 1 (02): _________________
- Bit 2 (04): _________________
- Bit 3 (08): _________________
- Bit 4 (10): _________________
- Bit 5 (20): _________________
- Bit 6 (40): _________________
- Bit 7 (80): _________________

---

## 📈 Schema Evolution Guidelines

### Version Control
- **Track changes**: Document all modifications to bit meanings
- **Backward compatibility**: Never change existing bit assignments
- **Migration tools**: Create scripts to handle schema updates
- **Version history**: Keep record of all schema versions

### Best Practices
- **Start simple**: Begin with basic categories, expand as needed
- **Test patterns**: Ensure your search patterns work effectively
- **Regular review**: Evaluate schema effectiveness after 20-30 entries
- **Reserved bits**: Keep some bits open for future discoveries

---

**Schema Status**: 🔧 TEMPLATE - Customize for your specific needs  
**Next Steps**: 1) Fill in your domains, 2) Test with sample entries, 3) Refine based on usage  
**Support**: Check the main README.md for examples and troubleshooting