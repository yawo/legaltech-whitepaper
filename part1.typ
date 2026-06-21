#import "utils.typ": part, chapter-image

#part[Understanding the Tools]

#chapter-image("./images/ch1-ai-ml.jpg")

= the legal AI feature set

Imagine a partner drops a folder of 200 contracts on your desk at 4pm on Friday. "I need a summary of all the change-of-control clauses by Monday." Two years ago, that meant a weekend lost to highlighters and sticky notes. Today, an AI platform can do it in twenty minutes.

The question is not whether AI can handle that work. It can. The question is whether you need to pay enterprise prices to get it done.

This chapter is not a sales pitch for either platform. It is a practical overview of what each one does well, what each one does not do, and how their features map to free or low-cost alternatives that solo and small-firm lawyers can use today.

== Harvey's core features

Harvey was founded in 2022 by Winston Weinberg, a former securities litigator, and Gabriel Pereyra, a former research scientist at Google DeepMind. By early 2026, it sat at an \$11 billion valuation, reported \$190 million in annual recurring revenue, and was used by more than 100,000 lawyers across roughly 1,300 organisations. It crossed \$100 million in ARR in August 2025 alone.

The platform processes over 400,000 agentic queries per day. That is not a marketing projection. It is production usage.

=== Document q&a and analysis

Harvey's strongest capability, and the one most relevant to this guide, is document analysis. In the 2025 VLAIR benchmark study, Harvey scored 94.8% accuracy on document Q&A tasks, outperforming human lawyers in several categories. You upload a contract or a set of contracts, ask a question in plain English, and the system returns a cited answer.

A typical prompt might be: "What are the termination clauses in this agreement, and are they more favourable to the licensee or the licensor?" Harvey reads the document, finds the relevant sections, and answers with references.

This is the capability we will replicate in Tutorial 1 with free tools.

=== Vault

Vault is Harvey's document repository. It lets firms upload up to 100,000 documents into a collaborative, spreadsheet-like workspace. Lawyers can query across the entire repository at once. Instead of asking about one contract, you can ask: "Across all our NDAs from 2024, which ones have unilateral termination rights?"

For firms managing large contract portfolios, this is a significant step up from folder-based document management. For solo practitioners with a few hundred contracts, a well-organised folder and a free AI tool can get you surprisingly close.

=== Workflows

Harvey's Workflows feature lets firms chain multiple AI steps into a single automated process. A due diligence workflow might: classify each document by type, extract key clauses, flag risks, and produce a summary report. The user triggers the workflow; the AI runs the chain.

By early 2026, more than 25,000 custom workflows had been built by Harvey users. This is where the platform moves from "useful assistant" to "operational infrastructure."

In Part 4 of this guide, we will build a simplified version of this using OpenCode and free AI models.

=== Agent builder

Agent Builder lets firms create custom AI agents for specific practice areas. A litigation team might build an agent that specialises in privilege review. A corporate team might build one for M&A due diligence. Each agent can be given custom instructions, access to specific document sets, and a defined scope of work.

This is Harvey's most powerful feature and the hardest to replicate with free tools. It is also the one most solo lawyers will not need.

=== Integrations and ecosystem

Harvey has a content partnership with LexisNexis, giving it access to statutes, case law, and citations directly within the platform. In early 2026 it announced a Microsoft 365 Copilot integration, allowing lawyers to access Harvey's capabilities from within Word and Teams.

These integrations matter because they reduce the number of tools a lawyer has to switch between. They also raise the cost. Harvey does not publish pricing; industry reports suggest indicative costs around \$4,000 per user per year for a 10-user team, with six-figure annual contracts for mid-size firms.

== Legora's core features

Legora, formerly known as Leya, is a Swedish company that reached a \$5.55 billion valuation in March 2026. It reported \$100+ million in annual recurring revenue, serving over 1,000 firms and in-house teams across more than 50 markets. Its customers include Bird & Bird, Cleary Gottlieb, White & Case, Linkers, Deloitte, Dentons, and Goodwin.

Where Harvey leads on raw scale, Legora is praised for its collaborative workflow design and its strength in multi-jurisdictional work. It was built for international practice from day one.

=== Tabular review

Legora's signature feature is Tabular Review. You upload a folder of contracts. The system turns them into an interactive grid: each document is a row, and you define custom prompts that generate columns. One column might extract the governing law clause. Another might pull the termination provisions. A third might flag whether the liability cap exceeds a threshold.

The result is a structured comparison across hundreds or thousands of documents, viewable and exportable as a spreadsheet. For M&A due diligence or large portfolio reviews, this is the feature that makes Legora stand out.

We will build a simplified version of this in Tutorial 2.

=== Legal AI assistant

Legora's AI Assistant works within the documents you provide. It handles multi-language documents, provides answers with citations, and maintains context across a conversation. It is designed to reduce hallucinations by grounding responses in the source material rather than relying on the model's general knowledge.

=== Microsoft Word add-in

Legora integrates directly into Microsoft Word, letting lawyers review, comment on, and mark up documents from within the add-in. This is a meaningful design choice. Lawyers who live in Word do not have to leave it to use AI. The add-in acts as a second pair of eyes during drafting and review.

=== Advanced legal research

Legora's research capabilities go beyond document-level Q&A. The system can access trusted legal databases, surface relevant precedents, verify citations, and interpret complex legal language. In May 2026, Legora acquired Qura to build out AI-native legal research, signalling a deeper investment in this area.

For lawyers who rely on up-to-date case law and regulatory guidance, this is a significant capability. Free alternatives exist, though they require more manual effort.

=== Team collaboration

Legora supports shared projects, prompt libraries that teams can build and reuse, and multi-user access to the same document sets. For firms that want AI capabilities embedded in their team workflow, not just available to individual users, this is a core part of the value proposition.

=== Pricing

Legora starts at approximately \$3,000 per user per year, with a minimum 10-seat commitment. That puts the minimum annual contract at \$30,000. Like Harvey, pricing is negotiated based on firm size and modules selected. Legora's implementation includes multi-language and multi-jurisdiction configuration that domestic-only firms may not need.

=== Integrations

Legora integrates with Microsoft Word and document management systems. It does not yet have the breadth of ecosystem partnerships that Harvey offers, but its European-first architecture gives it an edge on data sovereignty and GDPR compliance that matters to international firms.

== The feature map we will replicate

The rest of this guide is built around a simple premise: most of what Harvey and Legora do at the document level can be replicated with free tools, if you know how to prompt and where to look.

#table(
  columns: (1fr, 1fr, 1fr),
  [Feature], [Paid equivalent], [Free tool equivalent],
  [Document Q&A], [Harvey], [OpenCode + Gemini, Tutorial 1],
  [Tabular contract review], [Legora Tabular Review], [OpenCode + Llama 4, Tutorial 2],
  [Legal research assistant], [Legora Research, Harvey + LexisNexis], [OpenCode + DeepSeek R1, Tutorial 3],
  [Contract drafting agent], [Copilot Studio], [Copilot Studio free tier, Tutorial 4],
  [Due diligence workflow], [Harvey Workflows], [OpenCode + Gemini 2.5 Pro, Chapter 12],
  [Prompt library], [Legora team prompts], [Plain text file or Notion, Chapter 13],
)

This is not a perfect mapping. The paid platforms offer security, support, compliance, and scale that free tools cannot match. But for a solo practitioner or a small firm testing the waters, the free tools are enough to build working legal applications. That is what the next three parts of this guide walk through, step by step.

The chapters that follow will show you how to get free API keys, set up a vibe coding environment, and build each of the tools in the right-hand column. You will not need Harvey's budget. You will need patience, a willingness to iterate, and the lawyer's instinct for spotting when something is wrong.

/*
 *#chapter-image("./images/ch2-copilot.jpg")
 */

= Microsoft Copilot: your free starting point

A partner dictates a client letter into Word on the train home. By the time she reaches the station, Copilot has drafted a polished first version. She edits it on her phone and sends it before dinner. No dictation software, no assistant, no retyping.

That is what Microsoft Copilot does well. It handles the administrative work that surrounds legal practice: emails, documents, meetings, data. It is not built for the work that is legal practice: legal research, contract analysis, case law reasoning.

This chapter covers what Copilot does well for lawyers, where it falls short, and when to reach for something more capable.

== What you already have

Copilot for Microsoft 365 costs \$30 per user per month as an add-on to existing M365 business licenses. For a 25-lawyer firm, that is \$750 per month. Many firms already have it. If yours does, you have a starting point that requires no new software, no API keys, and no installation.

Here is what Copilot does in each Microsoft 365 application:

=== Word + Copilot

Copilot can draft documents from prompts, summarise long documents, rewrite sections, and suggest edits. For lawyers, this means first drafts of memos, client letters, and basic legal documents without leaving Word.

A typical prompt: "Draft a client update letter summarising the status of the due diligence process for the Meridian acquisition. Include a section on outstanding items and next steps. Use a professional tone." Copilot produces a draft. You review, edit, and send.

It does not know your jurisdiction's rules. It does not know your judge's preferences. It does not have access to your firm's clause library. For general document creation, it saves 15 to 30 minutes per document. For anything that requires legal precision, the final review is entirely yours.

=== Outlook + Copilot

This is where many lawyers see the fastest return. Copilot summarises email threads, drafts replies, prioritises the inbox, and flags action items. For a partner managing 200 emails a day, the time savings are immediate.

"You have 47 unread emails. Three require action today. Here is a summary of each." That is not a future capability. It is what Copilot does now.

=== Teams + Copilot

After a meeting, Copilot generates a summary, captures action items, and produces follow-up communications from the transcript. For firms that run client meetings and case conferences through Teams, the automatic summary eliminates the note-taking burden.

The quality of the summary depends on the quality of the audio and the clarity of the speakers. But even an imperfect summary is faster than writing one from scratch.

=== Excel + Copilot

Copilot can analyse data, create formulae, generate charts, and summarise spreadsheets. For litigation damages calculations, billing analysis, or financial discovery work, it turns a task that might take an hour into one that takes ten minutes.

=== PowerPoint + Copilot

Copilot creates presentations from documents or prompts. Useful for client pitches, partner meetings, and CLE sessions. The output is a starting point, not a finished product, but it removes the blank-page problem.

== Legal use cases step-by-step

Microsoft's legal scenario library documents several use cases that law firms have deployed in production. Here are the most relevant ones, with practical prompt examples.

=== Contract review in Word

Open a contract in Word. Activate Copilot. Use a prompt like:

"Review this contract and identify any clauses that deviate from standard market practice for a commercial lease agreement. Focus on the rent review, break clause, and repair obligations."

Copilot will flag clauses that appear unusual. It will not tell you what the market standard is. That part requires your judgement or a dedicated legal AI with market data. But the first-pass review, identifying what deserves a closer look, is genuinely useful.

=== Research memo drafting in Word

"Write a first draft of a research memo on the enforceability of non-compete clauses under UK employment law. Cover the current legal framework, recent case law, and practical considerations for advising a client."

Produces a structured draft with headings and body text. The citations are the problem. Copilot does not have access to legal databases. Any case names or statutes it generates must be verified independently. This is not optional. It is a professional responsibility requirement.

=== Deposition prep in Teams

After a deposition is recorded in Teams, use Copilot to generate a summary:

"Summarise this deposition transcript. Identify the key admissions made by the witness and any inconsistencies with their prior statements."

The summary is a starting point for your preparation. It is not a substitute for reading the transcript. But it lets you focus your reading on the passages that matter.

=== Due diligence checklist in Excel

"In this spreadsheet, I have a list of target companies. For each one, generate a due diligence checklist covering corporate governance, material contracts, intellectual property, employment matters, and regulatory compliance. Use columns for each category."

Copilot populates the table. You review, adjust for the specific transaction, and distribute to the team.

== Limits of Copilot and when to go further

Copilot is a productivity layer, not a legal layer. It is excellent at the tasks that surround legal work: emails, documents, meetings, data. It is not built for the tasks that are legal work: legal research, contract analysis, case law reasoning, regulatory compliance.

The distinction matters. Here is a practical breakdown:

#table(
  columns: (1fr, 1fr, 1fr),
  [Task], [Copilot sufficient?], [Go further when...],
   [Email triage and replies], [Yes], [Never: Copilot excels here],
   [Meeting summaries], [Yes], [Never: Teams Copilot is reliable],
  [Basic document drafting], [Yes], [The document requires legal precision or jurisdiction-specific knowledge],
  [Client letters and updates], [Yes], [The content involves substantive legal advice],
  [Contract review], [Partially], [You need market benchmarks or clause-by-clause redlining],
  [Legal research], [No], [You need verified case law, statutes, or citations],
   [Case law analysis], [No], [Always: Copilot does not have access to legal databases],
  [Damages calculations in Excel], [Yes], [The analysis is straightforward],
  [Court filing preparation], [No], [Court rules and formatting require jurisdiction-specific knowledge],
  [Regulatory compliance review], [No], [Regulatory databases and current guidance are essential],
)

== Security and data residency

One area where Copilot has a genuine advantage over standalone AI tools is data security. Copilot operates within your Microsoft 365 tenant. It inherits your existing permissions, retention policies, and compliance configurations. Prompts and responses stay within your tenant. Your data is not used to model training.

For firms already trusting Microsoft 365 with client data, which is virtually every firm, Copilot does not introduce a new security risk. The key requirement is that your Microsoft 365 security policies are properly configured before enabling Copilot. If your tenant still has default settings and open sharing policies, fix those first.

Microsoft reports that Copilot complies with SOC 2, ISO 27001, GDPR, and HIPAA through the broader Microsoft 365 compliance framework. For firms with regulatory obligations, this existing compliance infrastructure is a meaningful advantage over consumer AI tools.

== The billable hour question

Copilot creates an uncomfortable question for firms that bill by the hour. If AI does in ten minutes what used to take an hour, the hours-based revenue for that work drops. At \$30 per user per month, Copilot pays for itself if it saves 45 minutes per day per lawyer. At typical billing rates, that recovered time is worth \$4,500 to \$7,500 per month per lawyer.

Some firms are responding by moving toward value-based pricing for routine work. Others are simply absorbing the efficiency gain as a competitive advantage. Either way, the firms that adopt these tools early are better positioned than the firms that wait.

== The verdict on Copilot

Use Copilot for everything it handles well: email, meetings, basic documents, data analysis, and the administrative work that surrounds legal practice. Do not use it for substantive legal work that requires verified legal knowledge, jurisdiction-specific reasoning, or reliable citations.

For that work, you need the tools we will set up in the next two parts. Start with Copilot because it is already in your firm. Then build from there.

#emph[Note: Statistics and pricing figures in this chapter are drawn from industry reports and vendor claims referenced in the outline. TODO: verify against primary sources before publication.]
