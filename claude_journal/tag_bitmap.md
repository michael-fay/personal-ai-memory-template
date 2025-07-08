# Hex Tag Bitmap Schema - Template
## Version 1.0 - Personal AI Memory System

### 🎯 Minimal Required Schema
```
[DATE:16][SESSION:8][WORKSPACE:8][RESERVED:32]
└─Timestamp─┘└─Seq─┘└─Context─┘└─Available─┘
```

**40 hex characters**: `[DATE:4][SESSION:2][WORKSPACE:2][RESERVED:8].md`

---

## 📅 Date Domain (16 bits) - REQUIRED
**Epoch**: Days since 2025-01-01
**Range**: 0-65535 (179 years: 2025-2204)

| Value | Date | Hex |
|-------|------|-----|
| 0 | 2025-01-01 | 0000 |
| 187 | 2025-07-07 | 00BB |
| 365 | 2025-12-31 | 016D |

---

## 🔢 Session Domain (8 bits) - REQUIRED
**Daily session counter**: 0-255 (256 sessions per day maximum)
**Format**: Sequential numbering within each day

| Value | Session | Hex |
|-------|---------|-----|
| 0 | Session 0 | 00 |
| 1 | Session 1 | 01 |
| 8 | Session 8 | 08 |
| 255 | Session 255 | FF |

---

## 🏢 Workspace Domain (8 bits) - REQUIRED
**Project/Context Classification**

| Bit | Hex | Workspace | Description |
|-----|-----|-----------|-------------|
| 0 | 01 | Work | Primary job/career projects |
| 1 | 02 | Personal | Personal projects and learning |
| 2 | 04 | Consulting | Client work, freelance projects |
| 3 | 08 | Research | Academic work, investigations |
| 4 | 10 | **AVAILABLE** | Customize for your needs |
| 5 | 20 | **AVAILABLE** | Customize for your needs |
| 6 | 40 | **AVAILABLE** | Customize for your needs |
| 7 | 80 | **AVAILABLE** | Customize for your needs |

**Multi-workspace**: Use bit combinations (01+02 = Work+Personal integration)

---

## 🏗️ Reserved Domain (32 bits) - AVAILABLE
**Future organic growth and customization**

```
32 bits = 8 hex characters = 00000000
```

**Customization Philosophy**: 
- **Start minimal**: Only use required domains initially
- **Observe patterns**: Let your actual work guide what additional categories you need
- **Expand organically**: Add new domains when clear value emerges
- **Conservative growth**: Better to under-specify than over-specify

**Example Future Domains**:
- **Technology**: Programming languages, tools, frameworks
- **Activity**: Work types (implementation, debugging, research)
- **Status**: Progress states (complete, ongoing, blocked)
- **Context**: Collaboration styles (solo, team, client)

---

## 🔍 Basic Search Patterns

### Workspace Searches
```bash
# All work projects
ls ????01*.md

# All personal projects
ls ????02*.md

# All consulting work
ls ????04*.md

# All research work
ls ????08*.md
```

### Time-based Searches
```bash
# Today's work (example: day 187 = 00BB)
ls 00BB*.md

# This month's work (July 2025 = 00B?)
ls 00B?*.md

# Specific session (example: session 5)
ls ????05*.md
```

### Combined Searches
```bash
# All work project sessions today
ls 00BB??01*.md

# All personal project research
ls ????02*.md    # Personal projects
```

---

## 🛠️ Customization Guide

### 🎯 How to Expand Your Schema

1. **Use the system with minimal schema** for 2-3 weeks
2. **Observe your work patterns**: What categories appear repeatedly?
3. **Identify search needs**: What instant lookups would be valuable?
4. **Allocate reserved bits**: Use the 32 reserved bits for new domains
5. **Update this file**: Document your new categories
6. **Migrate existing files**: Update old entries to use new schema

### 📝 Reserved Bit Allocation Strategy

**Start with these if needed**:
- **TECH (8 bits)**: Your primary technologies/tools
- **ACTIVITY (8 bits)**: Your main work types  
- **STATUS (8 bits)**: Your progress tracking states
- **CONTEXT (8 bits)**: Your collaboration/focus modes

**Then customize based on your specific domain**:
- **Software Developer**: Programming languages, frameworks
- **Researcher**: Research domains, methodologies
- **Consultant**: Client types, service categories
- **Creative**: Media types, project phases

### 🎨 Professional Examples

**Software Developer Expansion**:
```
TECH:     01=Backend, 02=Frontend, 04=Mobile, 08=Infrastructure
ACTIVITY: 01=Code, 02=Debug, 04=Design, 08=Test
```

**Researcher Expansion**:
```
DOMAIN:   01=Biology, 02=Chemistry, 04=Physics, 08=Math
ACTIVITY: 01=Experiment, 02=Analysis, 04=Writing, 08=Review
```

**Consultant Expansion**:
```
CLIENT:   01=Tech, 02=Finance, 04=Healthcare, 08=Education
PHASE:    01=Discovery, 02=Strategy, 04=Implementation, 08=Delivery
```

---

## 📈 Evolution Guidelines

### Conservative Growth Principles
- **Only add bits when clear patterns emerge** from actual usage
- **Reserve majority of bits** for future organic discovery
- **Start simple**: Three required domains are sufficient initially  
- **Let usage drive expansion**: Actual work patterns should guide schema growth

### Migration Strategy
- **Keep old format working**: Ensure existing searches still function
- **Gradual expansion**: Add one domain at a time
- **Document changes**: Update this file with all modifications
- **Test thoroughly**: Verify new search patterns work as expected

---

**Schema Status**: 🎯 MINIMAL TEMPLATE - Ready for customization  
**Required Domains**: Date, Session, Workspace (24 bits used, 136 bits available)  
**Next Steps**: Use minimal schema, observe patterns, expand organically  
**Philosophy**: Start small, grow smart, let work patterns guide evolution