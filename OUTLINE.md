# OUTLINE.md — AI for Lawyers: Vibe Coding Your Legal Practice

> **Purpose:** A step-by-step whitepaper for non-technical lawyers who want to
> understand AI, use free tools, and build their own legal AI apps and agents
> through vibe coding — without writing a single line of code.

---

## PART 0 — PREFACE & PHILOSOPHY

### 0.1 Who This Guide Is For
- The practising lawyer who feels left behind by AI
- No coding background required — only curiosity and a browser
- What you will be able to do by the end

### 0.2 What "Vibe Coding" Means for Lawyers
- Defining it: you describe what you want in plain English; AI builds it
- Why this differs from learning to program
- The lawyer's superpower: you already know how to prompt (you draft, argue, instruct)
- 📎 *Fetch:* https://vibehackers.io/blog/getting-started-with-vibe-coding [web:21]
- 📎 *Fetch:* https://developer.microsoft.com/blog/complete-beginners-guide-to-vibe-coding-an-app-in-5-minutes [web:24]

### 0.3 The Legal AI Landscape in 2026
- From autocomplete to agentic workflows (Harvey, Legora, Spellbook)
- Why BigLaw tools cost €50k/year — and how to replicate 80% for free
- Ethical & professional responsibility considerations (confidentiality, hallucination, bar guidance)
- 📎 *Fetch:* https://www.srahq.com/post/legora-vs-harvey-ai-what-us-law-firms-should-actually-know-in-2026 [web:11]
- 📎 *Fetch:* https://www.aivortex.io/legal/compare/legora-vs-harvey/ [web:2]

---

## PART 1 — UNDERSTANDING THE TOOLS

### Chapter 1 — The Legal AI Feature Set (Harvey & Legora as North Stars)

#### 1.1 Harvey's Core Features
- Document Q&A and analysis (94.8% benchmark accuracy on VLAIR)
- Vault: repository for 100,000+ documents in a spreadsheet-like view
- Workflows: multi-step agentic chains (due diligence, drafting, research)
- Agent Builder: custom agents per practice area or matter type
- 📎 *Fetch:* https://aiagentstore.ai/compare-ai-agents/harvey-vs-legora [web:8]

#### 1.2 Legora's Core Features
- Tabular Review: folders of contracts → interactive grids (built on Claude)
- Legal AI Assistant with citations and multi-language support
- Microsoft Word Add-in: read/produce comments and markup in-document
- Advanced agentic legal research with trusted database access
- Team collaboration: shared projects, prompt libraries
- 📎 *Fetch:* https://spellbook.com/briefs/legora-vs-harvey [web:14]
- 📎 *Fetch:* https://aivoro.ai/comparison/harvey-vs-legora [web:5]

#### 1.3 The Feature Map We Will Replicate
- Table: Harvey/Legora feature → Free tool equivalent
- Priority ranking for solo/small firm lawyers

---

### Chapter 2 — Microsoft Copilot: Your Free Starting Point

#### 2.1 What You Already Have (M365 Copilot)
- Word + Copilot: drafting, summarising, redlining
- Excel + Copilot: damages calculations, billing analysis
- Outlook + Copilot: email triage, client updates
- Teams + Copilot: meeting summaries, action item drafts
- 📎 *Fetch:* https://www.aivortex.io/legal/guides/microsoft-copilot-legal-2026/ [web:26]
- 📎 *Fetch:* https://adoption.microsoft.com/en-us/scenario-library/legal/ [web:20]

#### 2.2 Legal Use Cases Step-by-Step
- Contract review in Word (prompt playbook with examples)
- Research memo drafting in Word
- Deposition prep in Teams
- Due diligence checklist generation in Excel
- 📎 *Fetch:* https://www.microsoft.com/en-us/microsoft-copilot/copilot-101/ai-for-legal [web:17]
- 📎 *Fetch:* https://techcommunity.microsoft.com/blog/microsoft365copilotblog/technology-and-talent-how-copilot-helps-mike-morse-law-firm-keeping-its-competitive-edge [web:23]

#### 2.3 Limits of Copilot & When to Go Further
- No legal clause libraries or firm precedent by default
- No custom agents out-of-the-box without Copilot Studio
- Security and data residency considerations for client data
- 📎 *Fetch:* https://www.spartaserv.com/resources/blog/ai-for-law-firms/ [web:29]

---

## PART 2 — GETTING YOUR FREE AI KEYS

### Chapter 3 — Google AI Studio: Your First Free API Key

#### 3.1 What Is an API Key and Why You Need One
- Plain-English explanation: a password that lets apps talk to AI
- What it unlocks: Gemini 2.5 Pro (free tier), 1M token context window (great for long contracts)

#### 3.2 Step-by-Step: Getting Your Gemini Key
1. Go to https://aistudio.google.com
2. Sign in with your Gmail account
3. Click "Get API key" → "Create API key in new project"
4. Copy and store the key immediately (password manager recommended)
5. Check your free quota limits on the pricing page
- 📎 *Fetch:* https://www.onlinelearner.in/blogs/how-to-use-google-ai-studio-openrouter-groq-for-free-chatgpt-api-keys-in-your-projects [web:12]
- 📎 *Fetch (YouTube):* https://www.youtube.com/watch?v=ATNYoL1viW0 [web:6]
- 📎 *Fetch (YouTube):* https://www.youtube.com/watch?v=vAzhif8b8yI [web:15]

#### 3.3 Testing Your Key (No Code)
- Using Google AI Studio's built-in playground
- Sending your first legal prompt (summarise a contract clause)
- Understanding rate limits and the free tier caps

---

### Chapter 4 — OpenRouter: One Key, 75+ Free Models

#### 4.1 Why OpenRouter Changes Everything
- One account, one key → access to DeepSeek R1, Llama 4, Qwen3, Gemini Flash, free Claude tiers
- No credit card required for free-tier models
- 📎 *Fetch:* https://buldrr.com/openrouter-free-api-keys-free-models-simple-guide/ [web:3]

#### 4.2 Step-by-Step: Creating Your OpenRouter Key
1. Go to https://openrouter.ai
2. Click Sign In → log in with your Gmail account
3. Click profile icon → Keys → Create Key
4. Name it (e.g., "legal-tools") → click Create
5. Copy the key — OpenRouter only shows it **once**
6. Store in a password manager
- 📎 *Fetch:* https://medium.com/four-nine-digital/free-ai-coding-assistant-setup-up-roo-code-with-free-llm-models-04beca21793d [web:9]

#### 4.3 Choosing the Right Free Model for Legal Work
- Comparison table: DeepSeek R1 vs Llama 4 vs Gemini 2.5 Flash for legal tasks
- Context window matters for long contracts and large document sets
- Reasoning models (DeepSeek R1) vs. fast models (Gemini Flash) — when to use which

---

## PART 3 — SETTING UP YOUR VIBE CODING ENVIRONMENT

### Chapter 5 — Installing OpenCode (The Free Cursor Alternative)

#### 5.1 What Is OpenCode
- Open-source AI coding agent (MIT licence, 167k GitHub stars as of 2026)
- Terminal UI — a standalone binary, not a VS Code plugin
- Supports 75+ models; works with OpenRouter and Google AI Studio keys
- Two modes: **Plan mode** (AI drafts what it will do, you review) and **Build mode** (AI executes)
- 📎 *Fetch:* https://aicoderscope.com/blog/opencode-review-2026/ [web:16]
- 📎 *Fetch:* https://ivern.ai/blog/opencode-review-open-source-ai-coding-agent-2026 [web:22]
- 📎 *Fetch:* https://www.nxcode.io/resources/blog/opencode-tutorial-2026 [web:25]

#### 5.2 Installation on Mac (Step-by-Step for Non-Techies)
1. Open Terminal (Spotlight → type "Terminal" → Enter)
2. Install Homebrew if not present: paste one command from brew.sh
3. Install Node.js: `brew install node`
4. Run: `npm install -g opencode-ai`
5. Launch: `opencode`
6. Enter your OpenRouter or Gemini API key when prompted
7. Verify: type a plain-English request in the chat box
- 📎 *Fetch (YouTube):* https://www.youtube.com/watch?v=7XQdp3hItX4 [web:1]

#### 5.3 Installation on Windows (Step-by-Step)
1. Download Node.js (LTS) from https://nodejs.org
2. Open PowerShell as Administrator (right-click Start → Windows PowerShell (Admin))
3. Run: `npm install -g opencode-ai`
4. Launch: `opencode`
5. Enter your API key
6. Optional: install Windows Terminal from the Microsoft Store for a better experience

#### 5.4 First Run: The OpenCode Interface Explained
- Switching between Plan mode and Build mode (Tab key)
- How to describe a task in plain English
- Reviewing the AI's plan before it touches any files
- Saving and resuming sessions (persisted in SQLite)

---

### Chapter 6 — Optional: VS Code + GitHub Copilot (Free Tier)

#### 6.1 When to Use VS Code Instead of OpenCode
- GUI preference over a terminal interface
- GitHub Copilot free tier (2,000 completions/month)
- Best for editing and understanding files visually

#### 6.2 Quick Setup
1. Download VS Code (free) from https://code.visualstudio.com
2. Install the "GitHub Copilot" extension from the Extensions panel
3. Sign in with a free GitHub account
4. Connect your OpenRouter key via Copilot Chat settings
- 📎 *Fetch (YouTube):* https://www.youtube.com/watch?v=gYyLlakxpK4 [web:4]

---

## PART 4 — BUILDING LEGAL TOOLS WITH VIBE CODING

### Chapter 7 — The Vibe Coding Mindset for Lawyers

#### 7.1 Your New Workflow
1. Write a one-page plain-English spec before opening any tool
2. Say "Tell me your plan, don't build yet" — review the AI's approach
3. Adjust the plan until you're satisfied
4. Switch to Build mode / approve
5. Test, describe what's wrong, iterate one change at a time

#### 7.2 Prompt Patterns for Legal Apps
- The "Harvey-style" Q&A prompt template
- The "Legora tabular review" extraction prompt template
- How to give context: jurisdiction, practice area, document type
- 📎 *Fetch:* https://www.vybe.build/blog/vibe-coding-for-non-technical-founders [web:30]

#### 7.3 What to Expect (and Not Expect)
- First attempt is rarely perfect — iteration is the process
- AI hallucinates: never trust legal citations without verification
- Version control basics: how to undo (the "revert early, revert often" rule)

---

### Chapter 8 — Tutorial 1: Contract Review Assistant (Harvey's Document Q&A)

#### 8.1 What We're Building
- A local web tool: upload a PDF contract → ask questions → get cited answers
- Equivalent to Harvey's Document Q&A and Legora's AI Assistant
- Estimated time: 30–45 minutes

#### 8.2 Step-by-Step Build with OpenCode
1. Open OpenCode → switch to Plan mode
2. Prompt: *"Build me a simple web app where I can upload a PDF contract and ask questions about it. Use the Gemini API. Show me your plan first."*
3. Review plan, request adjustments (e.g., add risk-flagging)
4. Switch to Build mode
5. Test with a sample NDA or service agreement
6. Iterate: add clause extraction, export to Word

#### 8.3 Connecting Your Gemini Key Safely
- Where to paste the API key in the generated app
- Setting environment variables on Mac (`.env` file) and Windows
- Keeping keys out of shared files and email

---

### Chapter 9 — Tutorial 2: Tabular Contract Review (Legora's Tabular Review)

#### 9.1 What We're Building
- Upload multiple contracts → AI extracts custom data columns → downloadable table
- Output: CSV or HTML table, importable into Excel for client reporting

#### 9.2 Designing Your Extraction Template
- Define columns before prompting: Party Names, Governing Law, Termination Clause, Liability Cap, Notice Period, Renewal Terms
- One prompt per column vs. one combined prompt — trade-offs

#### 9.3 Step-by-Step Build
1. Open OpenCode → Plan mode
2. Prompt: *"Build a web app to upload multiple PDF contracts. For each, extract: [your columns]. Display results in a downloadable table. Use OpenRouter with Llama 4."*
3. Review → Build → Test → Export to Excel

---

### Chapter 10 — Tutorial 3: Legal Research Agent

#### 10.1 What We're Building
- A chatbot: type a legal question → it researches → drafts a memo with citations
- Uses DeepSeek R1 (free reasoning model via OpenRouter) for deep analysis

#### 10.2 Connecting to External Legal Sources (Optional)
- Using public legal databases via URL (EUR-Lex, CourtListener, caselaw.io)
- RAG (Retrieval-Augmented Generation) explained in one paragraph for lawyers
- When to use public databases vs. your own documents

#### 10.3 Step-by-Step Build
1. Prompt: *"Build a legal research assistant. I type a question, it searches the web and drafts a memo with citations. Use DeepSeek R1 via OpenRouter."*
2. Review plan → Build → Add memo export to `.docx`

---

### Chapter 11 — Tutorial 4: MS Copilot Studio Agent for Contract Drafting

#### 11.1 Using Copilot Studio (Free Tier)
- What is Microsoft Copilot Studio and what the free tier allows
- 📎 *Fetch:* https://adoption.microsoft.com/en-us/scenario-library/legal/ [web:20]

#### 11.2 Building a Contract Drafting Agent
1. Open https://copilot.microsoft.com/studio
2. Create a new agent: "Contract Drafting Assistant"
3. Upload your firm's clause library as a knowledge source
4. Define topics: NDA, Service Agreement, Employment Contract
5. Test in Teams or Word

#### 11.3 Integrating with Microsoft Word
- Triggering your agent from within Word
- Generating first drafts from a bullet-point briefing
- Adding a review checklist step before finalising

---

## PART 5 — ADVANCED WORKFLOWS & RESPONSIBLE USE

### Chapter 12 — Due Diligence Workflow (Chaining AI Steps)

#### 12.1 The Use Case
- What lawyers do manually in M&A due diligence today
- What Harvey's Workflows automate (400,000+ agentic queries/day)
- Our free equivalent: OpenCode + Gemini 2.5 Pro (1M token context window)

#### 12.2 Designing the Workflow
- Input: folder of PDFs
- Steps: classify → extract → flag → summarise → output report
- Prompt chaining: breaking one large job into sequential AI calls

#### 12.3 Build & Run
- Build with OpenCode; run locally
- Output: formatted Word/PDF report ready for client delivery

---

### Chapter 13 — Building a Firm Prompt Library

#### 13.1 Why Every Lawyer Needs a Prompt Library
- Equivalent to Legora's team-crafted prompt libraries
- The difference between a good prompt and a great one

#### 13.2 Structure & Storage
- Categories: Research / Drafting / Review / Client Communication / Compliance
- Template format: `[Context] + [Task] + [Output Format] + [Constraints]`
- Storing in Notion, Word, or a plain `.md` file; sharing with colleagues

---

### Chapter 14 — Security, Confidentiality & Ethics

#### 14.1 The #1 Rule: Never Upload Real Client Data to Free Public APIs
- Difference between API calls (data leaves your device) and local models (data stays local)
- GDPR / SRA / bar ethics guidance on AI use

#### 14.2 Running Local Models for Sensitive Matters (Ollama)
- Installing Ollama on Mac and Windows (5-minute setup)
- Connecting Ollama to OpenCode as a local provider
- Recommended models for legal work: Llama 3.3, Mistral Large, Phi-4

#### 14.3 Logging, Audit Trails & Professional Responsibility
- Why you must review every AI output before use
- Keeping records of AI-assisted work product
- Disclosure obligations to clients and courts

---

## PART 6 — QUICK REFERENCE

### Appendix A — Tool Stack Summary

| Tool | Purpose | Cost | URL |
|---|---|---|---|
| Google AI Studio | Gemini API key | Free | aistudio.google.com |
| OpenRouter | Multi-model API key | Free tier | openrouter.ai |
| OpenCode | Vibe coding agent (terminal) | Free / OSS | opencode.ai |
| VS Code | Code editor (optional) | Free | code.visualstudio.com |
| GitHub Copilot | AI in VS Code | Free tier | github.com |
| MS Copilot (M365) | Drafting & research in Word/Teams | M365 licence | copilot.microsoft.com |
| Copilot Studio | Custom agent builder | Free tier | copilot.microsoft.com/studio |
| Ollama | Local private LLMs | Free / OSS | ollama.com |

### Appendix B — Prompt Templates
- Contract Q&A prompt
- Tabular extraction prompt
- Legal research memo prompt
- Risk flagging prompt
- Redlining / markup prompt

### Appendix C — Glossary for Lawyers
- API / API Key · Token / Context Window · RAG
- Agent / Agentic Workflow · LLM · Vibe Coding
- MCP (Model Context Protocol) · Fine-tuning vs. prompting

### Appendix D — Troubleshooting FAQ
- "My API key isn't working"
- "The app built but doesn't do what I asked"
- "I'm worried about client confidentiality"
- "How do I share this tool with my colleagues?"

---

*Resources marked 📎 should be fetched by the AI writing assistant to enrich each chapter with up-to-date content.*
