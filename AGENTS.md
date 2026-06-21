# AGENTS.md

## Writing and production guide for the Typst whitepaper

This document defines the voice, tone, structure, and Typst production conventions for the whitepaper described in `OUTLINE.md`: a practical guide that helps non-technical lawyers embrace AI and build useful legal tools through vibe coding.

Every chapter should feel like a knowledgeable lawyer with hands-on AI experience explaining the work over coffee. It should not read like a software manual, a vendor brochure, or a law firm marketing memo.

---

## Mission and audience

### Purpose

The whitepaper should help practising lawyers understand how to use AI safely, choose free or low-cost tools, and build simple legal apps and agents without learning to code in the traditional way.

The reader should finish each chapter with a clearer mental model and a practical next step.

### Reader

Write for practising lawyers who are curious but not technical. They may feel behind on AI, suspicious of hype, busy with client work, and wary of anything that sounds risky or childish.

Treat them as intelligent professionals. Do not over-explain basic legal judgment. Do explain technical concepts in plain English.

### Legal posture

This is an educational guide, not legal advice. Avoid presenting AI outputs as authoritative legal conclusions. Remind readers that lawyers remain responsible for judgment, verification, confidentiality, and client communication.

---

## Source of truth

### Primary files

Use `OUTLINE.md` as the source of truth for the whitepaper structure. Use this file for voice, ethics, and production rules.

If a chapter conflicts with the outline, follow the outline unless the user explicitly asks for a change.

### External resources

Use only sources provided in `OUTLINE.md` unless the user asks for additional research. Do not invent statistics, prices, product features, URLs, case names, statutes, or regulatory claims.

If a claim needs verification and no source is available, mark it with a clear `TODO: verify` note rather than filling the gap with a guess.

### Confidentiality

Never use real client data in examples, screenshots, prompts, or test files. Use fictional documents, anonymised facts, and invented names. If a section discusses confidentiality, be explicit that free public APIs can transmit data outside the lawyer's device or firm.

---

## Voice and tone

### Conversational but authoritative

Write like an experienced lawyer with practical AI experience speaking to another experienced lawyer. The voice should be warm, direct, and confident without being arrogant.

Good: "The model is the engine. The prompt, the file, the key, the review step, and the audit trail are the harness."

Bad: "This revolutionary platform empowers legal professionals to unlock transformative AI capabilities."

### Human and natural

Vary sentence length. Let some sentences breathe. Let others land. Read the text aloud. If it sounds like a conference room slide deck, rewrite it.

### Formal where the risk is real

Use a lighter tone for workflows and tools. Shift to a more careful tone for confidentiality, ethics, professional responsibility, hallucination, and client data.

### No cheerleading

Avoid hype. The reader already knows AI matters. What they need is clear thinking, not enthusiasm. Let the ideas speak for themselves.

---

## Typst authoring conventions

### Typst-first output

When writing content, produce Typst markup rather than Markdown unless the user asks otherwise.

### Use the Typst book template

Use the Typst book template `@preview/orange-book:0.7.1` as the production template for the whitepaper.

When creating or editing the main Typst file, import this template and keep chapter content modular in separate `.typ` files unless the user asks for a different structure.

Use Typst headings:

```typst
= Chapter title

== Section title

=== Subsection title
```

CRUCIALLY: Use sentence case for all headings. Only capitalize the first word and proper nouns.

### Keep files modular

When chapter files exist, place each chapter in its own `.typ` file. Keep the main Typst file focused on imports, structure, and page setup.

Prefer one chapter per file unless the user asks for a different structure.

### Use Typst for structure, not decoration

Use Typst features when they improve readability:

```typst
#em[important term]
#strong[warning]
#quote[Useful source excerpt or prompt.]
#list[
  - First point
  - Second point
]
#table(
  columns: (1fr, 2fr, 1fr),
  [Tool], [Use], [Cost],
  [Google AI Studio], [Gemini API key], [Free tier],
)
```

Avoid unnecessary styling, colour, or layout tricks. The writing should carry the value.

### Tables should earn their place

Use tables for feature maps, tool comparisons, prompt templates, glossary entries, and troubleshooting checklists. Do not use tables for narrative sections that should flow as prose.

### Code and prompts

Put commands, prompts, and configuration snippets in Typst code blocks. Keep them short enough to read. If a prompt is long, break it into a labelled template with placeholders.

Example:

````typst
```typst
Build me a simple web app where I can upload a PDF contract and ask questions about it. Use the Gemini API. Show me your plan first.
```
````

### Links and citations

Use Typst links for provided URLs. Do not create or guess URLs.

If a bibliography or citation system exists in the Typst project, use it. Otherwise, add a short source note near the relevant section or at the end of the chapter.

### British English

Use British English by default: "practising", "summarising", "licence", "finalising", "colour". Be consistent.

---

## Sentence structure

### Mix short and long sentences

This is the most important stylistic rule. Monotonous sentence length is the fastest way to lose a reader.

Good: "The model is the engine. Everything else, the tools, the memory, the guardrails, the orchestration, is the harness. And most teams spend all their time on the engine."

Bad: "The model is the engine. Everything else is the harness. Most teams spend all their time on the engine. This is a mistake."

The first example has flow. The second feels like a list.

### Avoid em dashes

Do not use em dashes anywhere in the text. Use a comma, period, colon, semicolon, or parenthesis instead.

### Use commas and periods as primary punctuation

Commas for pauses. Periods for full stops. Semicolons when two related thoughts deserve to stay in the same sentence. Parentheses are fine sparingly. Colons work well before lists or when setting up an explanation. Exclamation marks are not permitted.

---

## Paragraph and structure

### Keep paragraphs short to medium

Dense walls of text exhaust busy lawyers. Break paragraphs when the idea shifts, even slightly. A paragraph should hold one thought.

### Use white space generously

Readers skim before they commit to reading. White space invites them in. Let the page breathe.

### Lead with the idea, not the setup

Start paragraphs and sections with the point. Do not warm up with "In this section we will discuss..." Just discuss it.

### Use lists sparingly and naturally

Bullet lists are fine for reference material, summaries, checklists, prompt templates, and tool comparisons. They should not carry an argument or tell a story. If you find yourself writing more than three bullet points in a row, ask whether prose would work better.

---

## Vocabulary and word choice

### Prefer plain English

Use the simplest word that carries the correct meaning. "Use" not "utilize." "Start" not "commence." "Help" not "facilitate."

### Define terms once, then use them consistently

When introducing a technical term, define it clearly the first time it appears. Then use the same term. Do not swap synonyms just to sound varied.

For example, use "vibe coding" consistently rather than alternating between "AI-assisted development", "prompt-based programming", and "natural-language software creation" unless each term has a distinct meaning.

### Avoid jargon without context

If a term is specific to a platform, framework, or vendor, either define it generically or acknowledge the origin and then abstract it. The book is vendor-aware but not vendor-dependent.

Terms like "context engineering", "agent skills", "evaluation harness", "RAG", and "MCP" should feel like useful concepts, not product features.

### No buzzword pileups

Phrases like "leverage", "synergy", "paradigm shift", "game-changing", and "cutting-edge" are forbidden. If you catch yourself writing them, delete them and say what you actually mean.

---

## Addressing the reader

### Use "you" naturally

Address the reader directly when it helps. "You might find yourself..." "When you design an agent..." "The question you should ask..." This creates conversation. Do not overdo it.

### Use "we" for shared experience

When describing common experiences, mistakes, or realizations, "we" is warmer than "lawyers should..."

Good: "We have all seen a system fail because the person using it trusted the answer too quickly."

Bad: "Lawyers should exercise caution when reviewing AI outputs."

### No "the reader" or "the author"

Avoid third-person references to yourself or the reader. Write as one person talking to another.

---

## Examples and analogies

### Ground abstract ideas in concrete legal work

Every major concept should connect to a recognisable legal task: contract review, due diligence, research memo drafting, client intake, billing analysis, or matter management.

### Keep analogies short and purposeful

An analogy should illuminate, not entertain. One or two sentences. Then move on.

### Use real-world scenarios when possible

Place concepts in situations a lawyer recognises: a partner asks for a clause review before 5pm, a client sends a folder of contracts, a court deadline is approaching, or a junior lawyer needs a first-pass research memo.

---

## Chapter structure

### Open with a hook

Every chapter should begin with something that makes the reader want to keep reading: a question, scenario, observation, or short anecdote. Not a summary. Not a list of what the chapter covers.

### Build toward the mental model

The core of each chapter is a way of thinking, not a catalog of facts. Structure the chapter so that the reader arrives at the mental model through examples, reasoning, and evidence.

### Close with forward momentum

End each chapter by pointing toward the next idea, raising a new question, or connecting to a larger theme. The chapter should feel complete but not sealed off.

### Use the outline's key questions as anchors

Each chapter in `OUTLINE.md` includes questions it helps answer. Weave those questions into the narrative. Answer them through the chapter's reasoning rather than turning them into a boxed list at the beginning.

### Include practical outputs where useful

Many chapters should end with one or more of the following:

- A checklist
- A prompt template
- A short workflow
- A tool comparison table
- A risk-control note
- A "try this next" exercise

Use these sparingly. The whitepaper should still read like a coherent guide.

---

## Tool and product writing rules

### Be vendor-aware, not vendor-led

The outline compares Harvey, Legora, Microsoft Copilot, Google AI Studio, OpenRouter, OpenCode, VS Code, GitHub Copilot, Copilot Studio, and Ollama. Explain what each tool is useful for without making the chapter sound like an advertisement.

### Separate capability from claim

Write carefully about product features. A product may claim a benchmark, pricing model, or workflow. The whitepaper should say who claims it and why the reader should verify it.

### Free does not mean risk-free

When discussing free APIs, free tiers, or open-source tools, distinguish cost from risk. A tool can be free and still raise confidentiality, security, accuracy, or support concerns.

### API keys are passwords

Treat API keys as sensitive credentials. Explain where to store them, why they should not be shared, and why generated apps should keep them out of public files.

---

## Responsible AI rules

### Verify legal citations

Never invent case names, statutes, regulations, regulatory guidance, or citations. If a chapter needs legal authority, mark the gap for verification.

### Flag hallucination risk

Explain hallucination in practical terms: the model may sound confident while being wrong. Lawyers should verify important outputs against reliable sources before relying on them.

### Keep humans responsible

AI can draft, summarise, extract, compare, and propose. The lawyer decides whether the result is accurate, complete, ethical, and fit for the client.

### Prefer anonymised examples

Use fictional clients, fictional firms, and fictional documents. If a scenario resembles a real legal issue, keep it generic enough that no client information is exposed.

---

## What to avoid

- Em dashes. Seriously. None.
- Capitalized headings beyond the first word.
- Sentences that start with "In today's world..." or "In the age of AI..."
- Any sentence that could appear in a press release.
- Overexplaining. Trust the reader.
- Underexplaining. Do not assume knowledge you have not established.
- Repetition of the same sentence structure across multiple paragraphs.
- Metaphors that do not earn their place.
- Any phrase that sounds like it was written by a committee.
- Emojis in chapter text.
- Guessing URLs, statistics, prices, or legal authorities.

---

## Review checklist before finishing a chapter

Before marking a chapter complete, check:

- It follows `OUTLINE.md`.
- It opens with a hook, not a summary.
- It answers the chapter's key questions naturally.
- It explains technical ideas in plain English.
- It uses concrete legal scenarios.
- It avoids hype and vendor cheerleading.
- It includes Typst markup where appropriate.
- It avoids em dashes and unnecessary jargon.
- It does not invent sources, citations, prices, or product claims.
- It treats confidentiality, ethics, and hallucination with appropriate care.

---

## Final principle

Write every sentence as if the reader is tired, busy, and has a dozen other things they could be doing. Earn their attention on every page. Make the complex feel clear, not complicated. Make the clear feel insightful, not obvious.

The best technical writing for lawyers does not sound technical. It sounds like the smartest person in the room is talking to you, one on one, about something they genuinely understand.
