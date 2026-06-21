#import "utils.typ": part, promptbox, chapter-image

#part[Building Legal Tools with Vibe Coding]

#chapter-image("./images/ch7-mindset.jpg")

= The vibe coding mindset for lawyers

You describe what you want. The AI builds it. You test it. You describe what is wrong. The AI fixes it. That loop, describe, build, test, refine, is the core of vibe coding. It is also, if you think about it, the core of how lawyers have always worked with junior staff, assistants, and colleagues.

The tutorials in Chapters 8 through 11 will give you step-by-step instructions. This chapter explains how to approach those instructions so you get good results instead of frustration.

== Your new workflow

The biggest mistake new vibe coders make is opening the tool and typing "build me a legal app." That is like walking into a meeting with a junior associate and saying "write me a brief." You would never do that. You would give context, constraints, a deadline, and a clear description of the output you need.

The same discipline applies here. Follow this workflow for every tool you build:

#strong[Step 1: Write a one-page spec before opening any tool.] Describe what you want in plain English. Who will use it? What does it do? What are the inputs and outputs? What does success look like? This spec is not for the AI. It is for you. It forces you to think clearly before you start.

#strong[Step 2: Say "tell me your plan, don't build yet."] In OpenCode, stay in Plan mode. Let the AI draft what it intends to do. Read the plan carefully. Does it understand what you asked for? Is it missing anything? Is it doing something you did not ask for? This is the review step, and it is the most important one.

#strong[Step 3: Adjust the plan until you are satisfied.] Ask questions. Request changes. "Add a risk-flagging feature." "The output should be exportable to Word." "Use the Gemini API, not OpenRouter." Refine the plan until it matches your spec.

#strong[Step 4: Switch to Build mode and approve.] Only when the plan is right do you let OpenCode touch any files. Press Tab to switch to Build mode. Watch what it does. If something goes wrong, use `/undo` and describe the problem.

#strong[Step 5: Test, describe what is wrong, iterate one change at a time.] The first version will be 70-80% right. Test it. When you find a problem, describe it specifically and ask for one fix at a time. "The upload button does not work on mobile" is better than "fix the interface."

== Prompt patterns for legal apps

A prompt is what you type to tell OpenCode what to build. The quality of the output depends on the quality of your prompt. Here are three patterns that work well for legal tools.

=== The "Harvey-style" Q&A prompt template

Use this pattern when you want to build a tool that lets users upload documents and ask questions about them.

#promptbox[
  Build me a web app with the following features:
  - Users can upload a PDF document
  - Users can type questions about the document in a chat interface
  - The app sends the document and the question to the AI
  - The AI responds with an answer and cites the relevant section of the document
  - The interface is clean and works on both desktop and mobile
  - Use [Gemini API / OpenRouter with DeepSeek R1] for the AI backend
  - Show me your plan first before building anything.
]

The key elements: what the user does, what the app does, what the AI does, which model to use, and the instruction to plan first.

=== The "Legora tabular review" extraction prompt template

Use this pattern when you want to build a tool that extracts structured data from multiple documents.

#promptbox[
  Build me a web app with the following features:
  - Users can upload multiple PDF contracts at once
  - For each contract, extract the following fields: Party Names, Governing Law, Termination Clause, Liability Cap, Notice Period, Renewal Terms
  - Display the results in a table with one row per contract
  - Allow the user to download the table as a CSV file
  - Use [OpenRouter with Llama 4] for the AI backend
  - Show me your plan first before building anything.
]

Notice the specific column definitions. The more precisely you describe what you want extracted, the better the output.

=== How to give context: jurisdiction, practice area, document type

AI models do not know your practice area unless you tell them. When building a tool, include context in your prompt:

#promptbox[
  This tool is for a UK commercial law practice. It should:
  - Use British legal terminology (e.g., "solicitor" not "attorney")
  - Default to English law as the governing law
  - Reference UK court procedures where relevant
  - Format dates as DD/MM/YYYY
]

This context shapes every output the AI generates. Without it, the tool may use American terminology, reference US law, or format things in ways that feel foreign to your practice.

== What to expect (and not expect)

=== First attempt is rarely perfect

The first version of anything you build will have problems. A button that does not work. A layout that breaks on mobile. An AI response that misses the point. This is normal. It is not a sign that the tool is broken or that you are doing it wrong. It is how software gets built.

The difference between a successful build and a failed one is not the quality of the first attempt. It is the willingness to iterate. Plan for three to five rounds of feedback on every tool you build.

=== AI hallucinates: never trust legal citations without verification

This bears repeating. When an AI model generates a case name, a statute, or a legal proposition, it may be wrong. Confidently, plausibly, and completely wrong.

Every tool you build for legal work should include a disclaimer that outputs are for informational purposes only and must be verified against primary sources. This is not a limitation of the tool. It is a professional responsibility.

When you test your tools, pay special attention to any legal citations the AI generates. If it references a case, look it up. If it quotes a statute, check the actual text. If the citation does not exist, that is a hallucination, and you need to add a warning to the user.

=== Version control basics: how to undo

OpenCode has a built-in undo. Type `/undo` to reverse the last change. Type `/redo` to restore it. Use these liberally. If a change makes things worse, undo it and try a different approach.

For more permanent version control, you can initialise a git repository in your project folder. This lets you save snapshots of your project at any point and roll back to a previous version if something goes wrong. OpenCode can do this for you: ask it to "initialise a git repository and make an initial commit."

The rule is simple: revert early, revert often. Do not let a broken state persist because you hope the next fix will resolve it. Go back to the last working version and try again.

/*
 *#chapter-image("./images/ch8-contract-review.jpg")
 */

= Tutorial 1: Contract review assistant (Harvey's document Q&A)

This is the first build. You are going to create a web application that lets you upload a PDF contract, ask questions about it, and get cited answers. It is the free equivalent of Harvey's Document Q&A and Legora's AI Assistant.

Estimated time: 30-45 minutes.

== What we are building

A local web application with three features:

1. A file upload interface for PDF contracts.
2. A chat interface where you type questions about the uploaded contract.
3. AI-generated answers that cite the relevant sections of the document.

The app runs on your machine. Your documents never leave your computer unless you choose to send them to a cloud API. We will cover how to keep your data local in the security section.

== Step-by-step build with OpenCode

1. Create a project folder and open OpenCode:

```
mkdir contract-review
cd contract-review
opencode
```

2. Switch to Plan mode (press Tab if you are in Build mode).

3. Paste this prompt:

#promptbox[
  Build me a simple web app where I can upload a PDF contract and ask questions about it. The app should have:
  - A clean upload page where I can drag and drop a PDF
  - A chat interface where I can type questions about the contract
  - The AI should answer based on the content of the uploaded PDF
  - Answers should include citations referencing the relevant part of the document
  - The app should run locally on my machine
  - Use the Gemini API for the AI backend
  - Show me your plan first. Do not build yet.
]

4. Read the plan. Check for:
   - Does it understand the PDF upload requirement?
   - Does it plan to use the Gemini API as requested?
   - Does it include a chat interface?
   - Does it mention citation of source material?

5. Request adjustments if needed. For example:

#promptbox[
  Add a feature that flags potentially risky clauses (unlimited liability, unilateral termination, automatic renewal). Highlight these in yellow in the response.
]

6. When you are satisfied with the plan, press Tab to switch to Build mode. OpenCode will create the project files. This takes a few minutes.

7. When OpenCode finishes, it will tell you how to run the app. Typically:

```
npm install
npm run dev
```

8. Open the URL it gives you (usually http://localhost:3000) in your browser.

9. Test it. Upload a short PDF contract (a sample NDA works well). Ask a question: "What are the termination provisions?"

10. Evaluate the response. Is it accurate? Does it cite the right section? Is the interface usable?

11. Iterate. Describe what needs to change. For example:

#promptbox[
  The upload button is too small. Make it a full-width drag-and-drop zone. Also, add a loading indicator while the PDF is being processed.
]

== Connecting your Gemini key safely

The app needs your Gemini API key to talk to the AI. Here is how to connect it without exposing the key.

On Mac or Linux, create a file called `.env` in your project folder:

```
GEMINI_API_KEY=AIzaSyD...your key here...
```

On Windows, create the same file:

```
GEMINI_API_KEY=AIzaSyD...your key here...
```

The app should be configured to read from this file. If OpenCode did not set this up automatically, ask it to:

#promptbox[
  Update the app to read the Gemini API key from a .env file instead of hardcoding it.
]

#strong[Three rules for API key safety:]

1. Never paste your API key directly into the code. Always use a `.env` file.

2. Add `.env` to your `.gitignore` file so it never gets uploaded to a public repository. Ask OpenCode to do this: "Add .env to .gitignore."

3. Never share the `.env` file, email it, or paste it into a chat. If you accidentally expose the key, regenerate a new one from Google AI Studio immediately and update the file.

/*
 *#chapter-image("./images/ch9-tabular.jpg")
 */

= Tutorial 2: Tabular contract review (Legora's tabular review)

This tutorial builds a tool that takes multiple PDF contracts, extracts specified data from each one, and displays the results in a table you can download. It is the free equivalent of Legora's Tabular Review.

Estimated time: 30-45 minutes.

== What we are building

A web application with three features:

1. A multi-file upload interface for PDF contracts.
2. AI extraction of user-defined fields from each contract.
3. A results table, downloadable as CSV, that you can open in Excel.

== Designing your extraction template

Before you prompt OpenCode, decide what data you want extracted. Write it down. For a typical commercial contract review, you might want:

- Party Names
- Governing Law
- Termination Clause summary
- Liability Cap amount
- Notice Period duration
- Renewal Terms

You can customise these to your practice area. A litigation colleague might want different fields: dispute resolution mechanism, jurisdiction, limitation period, indemnification scope.

The key decision is whether to extract all fields in one prompt or one field per prompt. One combined prompt is faster but may miss details. Separate prompts per field are more thorough but take longer. For your first build, use one combined prompt. You can refine later.

== Step-by-step build

1. Create a project folder and open OpenCode:

```
mkdir tabular-review
cd tabular-review
opencode
```

2. Switch to Plan mode.

3. Paste this prompt, customising the fields to your needs:

#promptbox[
  Build a web app to upload multiple PDF contracts. For each contract, extract the following fields: Party Names, Governing Law, Termination Clause (summarise in 2-3 sentences), Liability Cap, Notice Period, Renewal Terms. Display results in a table with one row per contract and one column per field. Allow the user to download the table as a CSV file. Use OpenRouter with Llama 4 Maverick for the AI backend. Show me your plan first.
]

4. Review the plan. Check that it includes multi-file upload, table display, and CSV export.

5. Request adjustments. For example:

#promptbox[
  Add a progress indicator that shows which contract is being processed. Also, add a column for the contract file name so I can match rows to source documents.
]

6. Switch to Build mode. Let OpenCode build the app.

7. Run the app and test it with two or three sample contracts.

8. Evaluate the extraction quality. Are the fields populated correctly? Is the termination clause summary accurate? Are there fields the AI left blank or got wrong?

9. Iterate. If the extraction is inconsistent, try breaking it into separate prompts:

#promptbox[
  Instead of extracting all fields at once, process each field with a separate prompt. First pass: extract Party Names from all contracts. Second pass: extract Governing Law. Continue for each field.
]

10. Export the results to CSV and open in Excel. Check the formatting. Ask OpenCode to fix any issues with how the data appears.

/*
 *#chapter-image("./images/ch10-research.jpg")
 */

= Tutorial 3: Legal research agent

This tutorial builds a chatbot that takes a legal question, researches it, and drafts a memo with citations. It uses DeepSeek R1, a free reasoning model available through OpenRouter, for deep analysis.

Estimated time: 45-60 minutes.

== What we are building

A web application with three features:

1. A text input where you type a legal question.
2. AI-generated research that searches for relevant information.
3. A formatted memo with citations, exportable as a Word document.

This is the most ambitious tutorial. It involves web search, document generation, and careful prompt engineering. The result is a tool that can draft a first-pass research memo in minutes.

== Connecting to external legal sources (optional)

The quality of the research depends on the sources the AI can access. By default, the model uses its training data, which has a knowledge cutoff and may not include the latest cases or statutes.

You can improve results by connecting to public legal databases:

- EUR-Lex (EU law): https://eur-lex.europa.eu
- CourtListener (US case law): https://www.courtlistener.com
- caselaw.io (various jurisdictions)

The technique is called RAG: Retrieval-Augmented Generation. In plain English, it means the AI searches for relevant documents first, then uses those documents to answer your question instead of relying on memory alone.

For this tutorial, we will use the model's built-in capabilities. In Chapter 12, we will cover more advanced workflows.

== Step-by-step build

1. Create a project folder and open OpenCode:

```
mkdir legal-research
cd legal-research
opencode
```

2. Switch to Plan mode.

3. Paste this prompt:

#promptbox[
  Build a legal research assistant web app. The user types a legal question. The app researches the question and drafts a memo with the following sections: Question Presented, Brief Answer, Discussion, and Conclusion. The memo should include citations to relevant case law and statutes. Allow the user to export the memo as a .docx file. Use DeepSeek R1 via OpenRouter for the AI backend. Show me your plan first.
]

4. Review the plan. Check that it includes the memo structure, citation formatting, and docx export.

5. Request adjustments:

#promptbox[
  Add a field for the user to specify the jurisdiction (e.g., England and Wales, New York, Federal). Use this to tailor the research and citations. Also, add a disclaimer that the memo is a first draft and all citations must be verified.
]

6. Switch to Build mode. Let OpenCode build the app.

7. Run the app and test it with a real question. For example:

   "What are the key factors courts consider when deciding whether to grant an interim injunction in England and Wales?"

8. Evaluate the output. Is the memo well-structured? Are the citations real? (Check them. Every single one.) Is the analysis accurate?

9. Iterate. Common issues and fixes:

#promptbox[
  The citations include case names that sound plausible but do not exist. Add a step where the model verifies each citation against a legal database before including it in the memo.
]

#promptbox[
  The memo is too generic. Ask the model to include specific case references, statutory provisions, and practical advice for the solicitor handling the matter.
]

/*
 *#chapter-image("./images/ch11-copilot-studio.jpg")
 */

= Tutorial 4: MS Copilot Studio agent for contract drafting

This tutorial is different from the previous three. Instead of building a web app with OpenCode, you will build a contract drafting agent using Microsoft Copilot Studio. This agent lives inside Microsoft Teams and Word, where your lawyers already work.

No terminal required. No API keys to manage. If your firm has Microsoft 365, you likely have access to Copilot Studio's free tier.

== Using Copilot Studio (free tier)

Microsoft Copilot Studio is a platform for building custom AI agents that integrate with Microsoft 365. The free tier allows you to create agents that can:

- Answer questions based on documents you upload
- Follow custom instructions and topics
- Integrate with Teams and Word
- Use Microsoft's AI infrastructure (no separate API key needed)

This is the right tool when you want AI capabilities embedded in your existing workflow, not in a separate application.

== Building a contract drafting agent

1. Open https://copilot.microsoft.com/studio in your browser. Sign in with your Microsoft 365 account.

2. Click "Create" and select "New agent."

3. Name it "Contract Drafting Assistant."

4. In the instructions field, paste:

#promptbox[
  You are a contract drafting assistant for a UK commercial law practice. Your role is to help lawyers draft first versions of standard contracts. When asked to draft a contract or clause:
  - Use British legal terminology
  - Default to English law
  - Follow the firm's style guide (attached as a knowledge source)
  - Include standard protections: limitation of liability, termination for convenience, data protection provisions
  - Flag any unusual terms that require partner review
  - Always include a disclaimer that the draft must be reviewed by a qualified solicitor before use
]

5. Upload your firm's clause library as a knowledge source. This can be a Word document or PDF containing your standard clauses for NDAs, service agreements, employment contracts, and other common documents.

6. Define topics. Topics are pre-built conversation paths that guide the agent. Create three:

   - NDA: "Draft a mutual non-disclosure agreement for use between two UK companies."
   - Service Agreement: "Draft a standard service agreement for IT consultancy services."
   - Employment Contract: "Draft a standard employment contract for a permanent employee in England."

7. Test the agent in the built-in chat panel. Type: "Draft an NDA for a potential acquisition discussion." Review the output.

8. Refine the instructions based on what you see. If the output is too generic, add more specific guidance. If it misses key clauses, list them explicitly.

== Integrating with Microsoft Word

Once the agent works in Copilot Studio, you can make it available in Word:

1. In Copilot Studio, go to the "Channels" or "Integrations" section.

2. Enable the Microsoft Word integration. This adds the agent to Word's Copilot sidebar.

3. In Word, open the Copilot panel. Your Contract Drafting Assistant should appear as an available agent.

4. Test it: open a new document, open Copilot, and type: "Draft a service agreement for a software development project. Include IP ownership, payment terms, and a 30-day termination clause."

5. The agent generates the draft directly in the Word document. You edit, review, and finalise.

== Adding a review checklist step

A good contract drafting agent does not just generate text. It tells you what to check. Add this to your agent's instructions:

#promptbox[
  After generating any draft, include a review checklist at the end:
  - Verify all party names and details are correct
  - Confirm the governing law and jurisdiction
  - Check that the liability cap is appropriate for the transaction size
  - Ensure data protection provisions comply with UK GDPR
  - Review termination provisions for fairness
  - Confirm the signature block is complete
]

This turns the agent from a text generator into a drafting assistant that helps you work faster without skipping the steps that matter.
