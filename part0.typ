#import "utils.typ": part

#part[Preface & Philosophy]

= Who this guide is for

You picked this up for one of a few reasons. Maybe a colleague mentioned AI at lunch and you nodded along. Maybe a client asked whether your firm uses AI and you changed the subject. Maybe you have been watching the headlines, Harvey at \$11 billion, Legora at \$5.55 billion, and wondering whether you are falling behind.

You are not. But you are right to pay attention.

This guide is for the practising lawyer who wants to understand AI well enough to use it, and maybe even build with it, without going back to computer science school. No coding background is required. A browser, a Gmail account, and curiosity will take you further than you expect.

By the end, you will know how to get free AI API keys, set up a vibe coding environment on your own machine, and build simple legal tools: a contract review assistant, a tabular contract analysis app, a legal research agent. You will also understand the risks, confidentiality, hallucination, professional responsibility, and how to keep those risks under control.

This is not a software manual. It is a practical guide written by someone who has done this work and explained it to lawyers who thought they could not.

== What you will be able to do

#list[
  - Get free API keys from Google AI Studio and OpenRouter.
  - Set up OpenCode, a free AI coding agent, on Mac or Windows.
  - Build a web app that lets you upload a PDF contract and ask questions about it.
  - Build a tool that extracts data from multiple contracts into a table.
  - Build a legal research assistant that drafts memos with citations.
  - Understand when to use free tools, when to pay, and when to keep data off the internet entirely.
]

If none of those sentences made sense yet, that is fine. They will.

= What "vibe coding" means for lawyers

Here is the core idea in one sentence: you describe what you want in plain English, and AI builds it.

That is vibe coding. Not a framework. Not a brand. A way of building software by talking to a machine the way you talk to a colleague, except the colleague writes code at the speed of light and never needs coffee.

The term has been around since early 2025, and by 2026 it is how thousands of non-technical people build working apps every day. James Montemagno, a developer at Microsoft, gave GitHub Copilot a CSV file of his podcast metrics and asked it to "create a beautiful website that helps visualize, search, finds topics, and more." Five minutes later he had a working dashboard. He fixed a bug by typing "the numbers do not seem correct." He deployed it by asking for a GitHub Pages workflow. He never opened a terminal.

You already have the skill that matters most. Lawyers draft instructions for a living. You write briefs that tell a court what to decide. You write contracts that tell parties what to do. You write memos that tell a partner what the law says. Vibe coding is the same muscle, pointed at a different audience.

== Why this differs from learning to program

Learning to code traditionally means learning syntax, data structures, debugging, version control, and deployment. Months of study before you build anything useful.

Vibe coding inverts that. You start with the outcome. The AI handles the syntax. You review the result. If it is wrong, you describe what is wrong in plain English and the AI adjusts. The loop is minutes, not months.

This does not mean the output is always correct. It means you can get to "close enough to evaluate" fast, and then iterate. That is a different skill from programming, and for most lawyers, a more useful one.

== The lawyer's superpower

The best vibe coders are not the best programmers. They are the best describers. They can articulate what they want, spot what is wrong, and explain the gap.

You do this every day. When you redline a contract, you are comparing an output against an expectation and marking the differences. When you review a junior associate's draft, you are doing quality assurance. When you tell an assistant "I need a summary of the termination clauses, not the whole agreement," you are scoping a task.

Vibe coding rewards exactly those instincts.

= The legal AI landscape in 2026

The legal AI market in 2026 is large, fast-moving, and confusing. Two companies, Harvey and Legora, raised a combined \$750 million in fifteen days in March 2026. Harvey sits at an \$11 billion valuation. Legora at \$5.55 billion. Both are used by major firms. Both are expensive.

But here is what the headlines miss: the free tools available today can replicate a surprising amount of what those platforms do, if you know how to use them.

== From autocomplete to agentic workflows

The first wave of legal AI was autocomplete. Microsoft Copilot in Word would finish your sentence. Useful, but limited.

The current wave is agentic. Instead of completing a sentence, the AI runs a multi-step workflow. You give it a folder of contracts. It classifies them, extracts key clauses, flags risks, and produces a summary report. Harvey reported processing over 400,000 agentic queries per day by early 2026. Legora's Tabular Review turns large document sets into interactive comparison grids.

These are real productivity gains. They are also, in many cases, replicable with free tools and a bit of guidance. That is what this book teaches.

== Why biglaw tools cost €50k per year

Enterprise legal AI platforms charge for integration, support, security, compliance, and the comfort of a vendor relationship. Harvey and Legora are built for firms that need single sign-on, audit trails, firm-wide deployment, and a contract they can show a regulator.

If you are a solo practitioner or a small firm, you do not need most of that. You need the AI to work, the output to be reliable, and the data to stay safe. Free and open-source tools can deliver all three, with some trade-offs in convenience.

This guide will show you where the free tools match the paid ones, where they fall short, and how to decide what is right for your practice.

== Ethical and professional responsibility considerations

Using AI in legal work is not just a technical question. It is an ethical one.

#strong[Confidentiality.] When you send a document to a free public API, that data leaves your device. It may be processed on servers you do not control, in jurisdictions you have not agreed to. For sensitive client matters, this is not a theoretical risk. It is a professional responsibility issue. We will cover how to handle this, including running AI models locally so data never leaves your machine.

#strong[Hallucination.] AI models can generate confident-sounding legal analysis that is wrong. Case names that do not exist. Statutes that were never enacted. A lawyer who relies on AI output without verification is still responsible for the result. Every chapter in this book treats verification as a non-negotiable step.

#strong[Bar guidance.] Regulators are paying attention. The SRA, state bar associations, and courts are issuing guidance on AI use. Some jurisdictions now require disclosure of AI-assisted work product. We will flag the key obligations as they arise.

#strong[The human stays responsible.] AI can draft, summarise, extract, compare, and propose. The lawyer decides whether the result is accurate, complete, ethical, and fit for the client. That division of labour does not change because the tool gets more capable.

This guide takes those obligations seriously. Every tutorial includes a section on what can go wrong and how to protect your clients and yourself.

= What comes next

The book is organised in six parts. Part 1 helps you understand the legal AI landscape and the tools available. Part 2 walks you through getting free API keys. Part 3 sets up your vibe coding environment. Part 4 is where you build: four tutorials, each producing a working legal tool. Part 5 covers advanced workflows, prompt libraries, and security. Part 6 is a quick-reference appendix.

You do not have to read it front to back. But the tutorials build on each other, so if you are new to this, starting at the beginning will serve you well.

Let us get started.
