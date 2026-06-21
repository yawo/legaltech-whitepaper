#import "utils.typ": part, promptbox, chapter-image

#part[Advanced Workflows & Responsible Use]

#chapter-image("./images/ch13-prompt-library.jpg")

= Due diligence workflow (chaining AI steps)

A client calls on Monday. The acquisition closes in six weeks. Somewhere in the target company's files sit 300 contracts nobody has read properly. Two years ago, that meant hiring a team of juniors and cancelling weekend plans. Today, you can build a tool that does the first pass before lunch.

== The use case

In a typical M&A due diligence exercise, a lawyer receives a data room containing hundreds of contracts. The task is to review each one, extract key terms, flag risks, and summarise the findings in a report. A junior team might spend weeks on this work.

Harvey's Workflows product automates this process using agentic chains: multi-step AI pipelines that classify documents, extract data, flag issues, and generate reports with minimal human intervention. Harvey reports processing over 400,000 agentic queries per day for its clients.

You can replicate about 80% of this capability for free using OpenCode and Gemini 2.5 Pro. The key advantage of Gemini for this work is its one million token context window, which means it can process very long contracts in a single call without losing the beginning of the document by the time it reaches the end.

The trade-off is that you will need to design the workflow yourself and iterate on the prompts. That is what this chapter covers.

== Designing the workflow

A due diligence workflow has five steps:

#strong[Step 1: Classify.] The AI reads each document and determines what type of contract it is. Employment agreement, lease, service agreement, NDA, loan document, licence. This determines which extraction template to apply in the next step.

#strong[Step 2: Extract.] For each contract, the AI extracts the key fields that matter for due diligence: parties, effective date, expiration date, renewal terms, termination rights, governing law, liability caps, change-of-control provisions, and any unusual clauses.

#strong[Step 3: Flag.] The AI identifies risk factors: change-of-control clauses that could be triggered by the acquisition, non-assignment provisions, unlimited liability, unusual termination penalties, or missing key protections.

#strong[Step 4: Summarise.] The AI produces a one-paragraph summary of each contract, highlighting the key terms and any flagged risks.

#strong[Step 5: Output report.] All of the above is compiled into a formatted report, organised by contract type, suitable for client delivery.

The technique that makes this work is prompt chaining: breaking one large job into sequential AI calls, where the output of each step becomes the input for the next. Instead of asking the AI to do everything at once (which produces shallow results), you ask it to do one thing well, then feed those results into the next step.

== Build and run

1. Create a project folder and open OpenCode:

```
mkdir due-diligence
cd due-diligence
opencode
```

2. Switch to Plan mode.

3. Paste this prompt:

#promptbox[
  Build a due diligence workflow tool. It should:
  - Accept a folder of PDF contracts as input
  - For each contract: classify the type, extract key terms, flag risks, and produce a summary
  - Key terms to extract: Parties, Effective Date, Expiration Date, Renewal Terms, Termination Rights, Governing Law, Liability Cap, Change-of-Control Provisions
  - Risk flags to identify: change-of-control triggered by acquisition, non-assignment clauses, unlimited liability, unusual termination penalties, missing key protections
  - Compile all results into a formatted report organised by contract type
  - Export the report as a Word document (.docx)
  - Use Gemini 2.5 Pro via the Gemini API
  - Show me your plan first.
]

4. Review the plan carefully. This is a complex build. Check that it includes all five steps: classification, extraction, flagging, summarisation, and report generation. Check that it uses Gemini 2.5 Pro specifically, not a smaller model.

5. Request adjustments:

#promptbox[
  Add a progress indicator that shows which document is being processed and which step it is on. Also, add a summary page at the beginning of the report with statistics: total contracts reviewed, number of each contract type, number of high-risk flags.
]

6. Switch to Build mode. This build will take longer than the previous tutorials. OpenCode may need to create multiple files and install several dependencies.

7. Run the app and test it with a small set of sample contracts. Start with five to ten documents. Check each step:

   - Are the contract classifications correct?
   - Are the extracted fields accurate?
   - Are the risk flags appropriate?
   - Is the summary useful?
   - Is the report well-formatted?

8. Iterate. The most common issues at this stage:

#promptbox[
  The classification is wrong for some documents. Add a confidence score: if the model is less than 80% confident about the contract type, label it as "Uncertain" and include it in a separate section of the report.
]

#promptbox[
  The extraction misses fields that are worded unusually. Add a fallback: if a field cannot be found, output "Not found" instead of guessing.
]

9. Once the workflow works on a small set, scale up. Try it with 20, then 50 contracts. Watch for performance issues. If processing is slow, ask OpenCode to add parallel processing:

#promptbox[
  Process up to 5 contracts simultaneously to speed up the workflow.
]

The finished tool will not replace a thorough lawyer's review of a data room. It will get you 80% of the way there in a fraction of the time, leaving you to focus on the judgement calls that require a human.

/*
 *#chapter-image("./images/ch13-prompt-library.jpg")
 */

= Building a firm prompt library

A senior associate spends twenty minutes crafting the perfect prompt for extracting termination clauses. It works beautifully. Then she leaves the firm, and the prompt leaves with her. Six months later, another associate starts from scratch.

This scenario plays out in firms every day. The fix is not better prompts. It is a system for capturing and sharing them.

== Why every lawyer needs a prompt library

A prompt library is a shared collection of tested, reliable prompts for common legal tasks. It is the equivalent of a firm's precedent bank, but for AI instructions instead of contract clauses.

Legora offers this as a built-in feature: teams can create, share, and collaborate on prompt libraries within the platform. The prompts in this guide are a starting point. A firm prompt library is what turns those starting points into institutional knowledge.

The difference between a good prompt and a great one is iteration. The first version of a prompt produces acceptable output. The tenth version, refined by three different lawyers who each found different weaknesses, produces excellent output. A prompt library captures that refinement so every lawyer in the firm benefits.

== Structure and storage

Organise your prompt library by task category. Here is a structure that works well for most practices:

- #strong[Research:] Prompts for legal research, case analysis, statutory interpretation, and regulatory guidance.
- #strong[Drafting:] Prompts for contracts, letters, memos, pleadings, and client communications.
- #strong[Review:] Prompts for contract review, due diligence, compliance checking, and risk assessment.
- #strong[Client communication:] Prompts for client updates, plain-English explanations of legal concepts, and fee estimates.
- #strong[Compliance:] Prompts for GDPR analysis, anti-money laundering checks, and regulatory filings.

Within each category, use a consistent template format:

#promptbox[
  [Context]: Who is this for? What is the practice area? What jurisdiction?
  [Task]: What should the AI do? Be specific.
  [Output format]: What should the response look like? Memo, table, bullet points, draft clause?
  [Constraints]: What should the AI avoid? What tone should it use? Any mandatory inclusions?
]

Here is an example of a well-structured prompt from the Review category:

#promptbox[
  [Context]: UK commercial law practice. Reviewing a SaaS agreement on behalf of the customer.
  [Task]: Identify all clauses that are unfavourable to the customer. For each, explain why it is unfavourable and suggest alternative wording.
  [Output format]: A table with three columns: Clause Reference, Issue, Suggested Alternative.
  [Constraints]: Focus on liability, termination, data ownership, and SLA provisions. Use British legal terminology. Flag any clause that would be unusual in a standard SaaS agreement.
]

Store your prompt library wherever your firm already collaborates. A shared Word document works. A Notion page works better because it is searchable and versioned. A plain Markdown file in a shared folder works if your firm prefers simplicity.

The key is that it must be shared. A prompt library that lives in one lawyer's notebook helps one lawyer. A prompt library that lives where everyone can find it helps the firm.

== Contributing to the library

Establish a simple rule: if you refine a prompt and get a better result, share it. Add it to the library with a note about what you changed and why. Over time, the library becomes one of the firm's most valuable assets: a collection of instructions that reliably produce high-quality legal work with AI assistance.

/*
 *#chapter-image("./images/ch14-security.jpg")
 */

= Security, confidentiality & ethics

A solicitor uploads a client's contract to a free AI API. The contract contains the client's name, the other party's name, the deal terms, and a damages clause that could be worth millions. The API processes it on a server in another country. The data is logged. The client never consented.

No regulator would accept "I did not know" as a defence. Yet this scenario is happening in firms right now, not because lawyers are reckless, but because the tools make it frictionless and the risks are invisible.

== The number one rule: never upload real client data to free public APIs

When you use a free API like Gemini through Google AI Studio or any model through OpenRouter, your data leaves your device and travels to a server you do not control. That server may be in a different jurisdiction. The data may be logged, stored, or used to train future models.

This is not a theoretical risk. It is a direct conflict with your duty of confidentiality.

The rule is simple: #strong[never upload real client documents, real client names, real matter details, or any identifiable client information to a free public API.]

Use fictional documents for testing. Use anonymised data for development. When you need to process real client data, use one of the approaches described in the next section.

Understand the distinction:

- #strong[API calls:] Your data is sent to a third-party server. You are trusting that provider's security, data handling policies, and jurisdiction. Free tiers typically offer fewer privacy guarantees than paid enterprise tiers.
- #strong[Local models:] Your data stays on your device. Nothing is sent to any server. The AI runs on your own hardware. This is the only safe approach for sensitive client matters.

GDPR, the SRA's guidance on technology and AI, and bar ethics codes across jurisdictions all impose obligations on lawyers who use AI. The specific rules vary, but the principle is consistent: you are responsible for protecting client data, regardless of what tool you use to process it.

== Running local models for sensitive matters (Ollama)

Ollama is a free, open-source tool that runs AI models on your own computer. It is available for Mac and Windows. When you use Ollama, your data never leaves your machine.

Installing Ollama takes about five minutes:

1. Go to https://ollama.com and download the installer for your operating system.
2. Run the installer. No command line is needed for the basic setup.
3. Open a terminal and pull a model:

```
ollama pull llama3.3
```

4. Test it:

```
ollama run llama3.3
```

You now have a fully functional AI model running on your device. It is slower than cloud APIs, especially on older hardware, but it is private.

To connect Ollama to OpenCode:

1. Open OpenCode's configuration. Ask OpenCode directly:

#promptbox[
  Add Ollama as a local provider. Use the model llama3.3.
]

2. OpenCode will configure the connection. Once connected, you can select the Ollama provider when starting a new session.

3. Verify it works by starting a new OpenCode session with the Ollama provider and sending a test prompt.

Recommended models for local legal work:

- #strong[Llama 3.3] (70 billion parameters): Good general performance. Requires at least 16GB of RAM, preferably 32GB.
- #strong[Mistral Large]: Strong reasoning capabilities. Higher hardware requirements.
- #strong[Phi-4] (14 billion parameters): Lighter weight, runs on more modest hardware. Good for straightforward tasks.

The quality of local models is lower than the best cloud models. For sensitive client work, that trade-off is worth it. Use local models when confidentiality matters. Use cloud APIs when you are working with fictional or anonymised data and need the best possible output.

== Logging, audit trails & professional responsibility

=== Why you must review every AI output before use

AI can draft, summarise, extract, compare, and propose. It cannot judge. It does not know your client's commercial objectives, risk tolerance, or the other side's likely position. It does not know which arguments will persuade a particular judge or which clauses a particular client will never accept.

Every output an AI generates is a first draft. You are responsible for verifying that it is accurate, complete, appropriate, and fit for purpose. This is not a new obligation. It is the same obligation you have always had when reviewing work product, whether it was prepared by a junior associate or a paralegal.

The risk with AI is that the output sounds confident and looks polished, which makes it easy to trust without checking. Resist that impulse.

=== Keeping records of AI-assisted work product

When you use AI to assist with client work, keep a record of:

- Which tool or model was used.
- What input was provided (the prompt and any documents).
- What output was generated.
- What review and editing you performed before the work product was finalised.

This record serves two purposes. First, it demonstrates that you exercised professional judgement rather than simply accepting AI output. Second, it provides an audit trail if a question ever arises about how a particular piece of work was prepared.

You do not need a sophisticated system for this. A simple log in a spreadsheet or document is sufficient. The key is consistency: log every use, every time.

=== Disclosure obligations to clients and courts

The question of whether you must disclose your use of AI to clients or courts is evolving. Some jurisdictions are beginning to require disclosure of AI use in filed documents. Some clients are beginning to ask.

The safest approach is transparency. If a client asks whether you used AI to prepare a document, tell them. If a court requires disclosure, disclose. Do not present AI-generated work as if it were entirely your own creation, and do not hide the use of AI when asked.

This is an area where the rules are still developing. Keep an eye on guidance from your regulator, your bar association, and your professional indemnity insurer. When in doubt, disclose.

== The bottom line

AI is a tool. Like any tool, it can be used well or poorly, safely or recklessly. The lawyers who benefit most from AI will be those who combine its capabilities with their own judgement, who treat confidentiality as non-negotiable, and who never forget that the work product bears their name.

Build tools. Iterate on prompts. Chain workflows. But never outsource your professional responsibility to a model that does not know your client, does not understand your jurisdiction, and does not face the consequences if something goes wrong.

#emph[Note: Hardware specifications and model parameter counts in this chapter are drawn from vendor documentation referenced in the outline. TODO: verify against primary sources before publication.]
