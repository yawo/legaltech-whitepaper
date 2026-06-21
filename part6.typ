#import "utils.typ": part, promptbox, chapter-image

#part[Quick Reference]
#chapter-image("./images/ch14-security.jpg")

 = Appendix A: Tool stack summary


This table lists every tool referenced in this guide, what it is for, what it costs, and where to find it.

#table(
  columns: (1fr, 2fr, 1fr, 1.5fr),
  [Tool], [Purpose], [Cost], [URL],
  [Google AI Studio], [Gemini API key], [Free], [aistudio.google.com],
  [OpenRouter], [Multi-model API key], [Free tier], [openrouter.ai],
  [OpenCode], [Vibe coding agent (terminal)], [Free / OSS], [opencode.ai],
  [VS Code], [Code editor (optional)], [Free], [code.visualstudio.com],
  [GitHub Copilot], [AI in VS Code], [Free tier], [github.com],
  [MS Copilot (M365)], [Drafting and research in Word/Teams], [M365 licence], [copilot.microsoft.com],
  [Copilot Studio], [Custom agent builder], [Free tier], [copilot.microsoft.com/studio],
  [Ollama], [Local private LLMs], [Free / OSS], [ollama.com],
)

= Appendix B: Prompt templates

These templates are ready to use. Copy them into your prompt library, customise the bracketed fields, and adapt them to your practice.

== Contract Q&A prompt

#promptbox[
  You are a [jurisdiction] solicitor reviewing a [document type].

  I will provide the text of the document and a question about it. Respond with:
  1. A direct answer to the question
  2. The specific clause or section that supports your answer
  3. Any related risks or issues the lawyer should be aware of

  If the document does not contain enough information to answer the question, say so clearly.

  Document: [paste document text]
  Question: [your question]
]

== Tabular extraction prompt

#promptbox[
  You are a [jurisdiction] solicitor conducting a review of multiple contracts.

  For each contract I provide, extract the following fields and present them in a table:
  - Party Names
  - Governing Law
  - Effective Date
  - Expiration Date
  - Termination Clause (summarise in 2 sentences)
  - Liability Cap
  - Notice Period
  - Renewal Terms

  If a field cannot be found in the contract, write "Not found" rather than guessing.

  Contract: [paste contract text]
]

== Legal research memo prompt

#promptbox[
  You are a [jurisdiction] solicitor. Draft a research memo on the following question.

  Jurisdiction: [specify jurisdiction]
  Question: [your question]

  Structure the memo as follows:
  1. Question Presented (restate the question)
  2. Brief Answer (2-3 sentences)
  3. Discussion (detailed analysis with references to case law and statutes)
  4. Conclusion (practical advice for the solicitor handling this matter)

  Include a disclaimer that all citations must be verified against primary sources before reliance.
]

== Risk flagging prompt

#promptbox[
  You are a [jurisdiction] solicitor reviewing a [document type] on behalf of [client type].

  Identify all clauses that pose a risk to the client. For each risk:
  1. Quote the relevant clause
  2. Explain why it is risky
  3. Rate the risk as High, Medium, or Low
  4. Suggest alternative wording that would better protect the client

  Focus on: liability provisions, termination rights, indemnification, data protection, and any unusual or non-standard terms.

  Document: [paste document text]
]

== Redlining / markup prompt

#promptbox[
  You are a [jurisdiction] solicitor. I will provide the current version of a clause and the client's requested changes.

  Provide:
  1. A tracked-changes version showing the proposed amendments
  2. A brief explanation of each change
  3. Any risks introduced by the proposed changes
  4. Any additional protections that should be considered

  Current clause: [paste current text]
  Requested changes: [describe changes]
]

= Appendix C: Glossary for lawyers

This glossary defines every technical term used in this guide. Terms are explained in plain English, not technical jargon.

== API (Application Programming Interface)

A way for two software programs to talk to each other. When you use the Gemini API, your app sends a request to Google's servers and receives a response. Think of it as a messenger that carries your question to the AI and brings the answer back.

== API key

A unique code that identifies you to an API provider. It works like a password. Anyone who has your API key can use your account, potentially running up charges or accessing your data. Store it securely and never share it in code, email, or chat.

== Token

A unit of text that AI models process. One token is roughly one word or a large part of a word. "Contract" is one token. "Indemnification" might be two or three. Every model has a limit on how many tokens it can process in a single request.

== Context window

The maximum number of tokens a model can consider at once. A model with a 100,000 token context window can read about 75,000 words in a single request, roughly 300 pages. Gemini 2.5 Pro offers a one million token context window, which means it can process an entire folder of contracts in one call. This matters for legal work because long documents lose coherence when the model cannot see the whole thing at once.

== RAG (Retrieval-Augmented Generation)

A technique where the AI searches for relevant documents or data before generating an answer. Instead of relying only on what it learned during training, it retrieves up-to-date information from a database, a website, or a set of documents you provide. This improves accuracy and reduces hallucination.

== Agent / agentic workflow

An AI agent is a system that can take actions, not just answer questions. It can search the web, read files, run code, and make decisions. An agentic workflow chains multiple actions together: the AI classifies a document, then extracts data, then flags risks, then generates a report. Each step builds on the previous one.

== LLM (Large Language Model)

The technical term for the type of AI used in this guide. An LLM is a model trained on vast amounts of text that can generate human-like responses. GPT-4, Claude, Gemini, Llama, and Mistral are all LLMs. They differ in training data, size, capabilities, and cost.

== Vibe coding

The practice of building software by describing what you want in plain English and letting AI generate the code. You do not write code. You describe requirements, review plans, and iterate on results. The AI handles the technical implementation.

== MCP (Model Context Protocol)

A standard way for AI models to connect to external tools and data sources. MCP lets an AI assistant read files from your computer, query a database, or interact with a legal research platform. It is the plumbing that connects AI models to the outside world.

== Fine-tuning vs. prompting

Fine-tuning means training a model on your specific data so it learns your firm's style, terminology, and precedents. It is expensive and technically complex. Prompting means giving the model instructions and context in your request. It is free and immediate. For most lawyers, prompting is the right approach. Fine-tuning is for organisations with large, consistent datasets and technical resources.

= Appendix D: Troubleshooting FAQ

== "My API key is not working"

Check these in order:

1. Did you copy the full key? Keys are long. Make sure you did not miss characters at the beginning or end.
2. Is the key stored in a `.env` file? The app needs to read it from the environment, not from a comment or a separate document.
3. Did you restart the app after adding the key? Environment variables are loaded when the app starts.
4. Has the key expired? Some providers rotate keys. Generate a new one from the provider's dashboard.
5. Have you exceeded your free quota? Check your usage on the provider's website. Free tiers have daily or monthly limits.

== "The app built but does not do what I asked"

This is the most common issue and it is almost always a prompt problem, not a code problem.

1. Re-read your prompt. Was it specific enough? "Build a contract review tool" is vague. "Build a web app that accepts PDF uploads, extracts the termination clause, and flags if the notice period is less than 30 days" is specific.
2. Check the plan. Did you review the plan before switching to Build mode? If the plan was wrong, the build will be wrong. Undo and fix the plan first.
3. Iterate with precision. Instead of "fix it," say "the upload button only accepts PDF files. I also need it to accept Word documents (.docx)."
4. Check the model. Some tasks require a more capable model. If Gemini Flash is producing shallow results, switch to Gemini 2.5 Pro or DeepSeek R1.

== "I am worried about client confidentiality"

You should be. Here is the safe approach:

1. For development and testing, use only fictional documents. Invent a company, write a sample contract, and test with that.
2. For real client work, use Ollama to run models locally. Your data stays on your device.
3. If you must use a cloud API for client work, use a paid enterprise tier that offers data processing agreements and does not use your data for training. Google, Anthropic, and OpenAI all offer enterprise options with stronger privacy commitments than their free tiers.
4. Never paste client names, matter details, or identifiable information into a free chat interface or API.

== "How do I share this tool with my colleagues?"

There are several approaches, depending on technical comfort:

1. #strong[Share the project folder.] Copy the folder to a shared drive. Each colleague installs the dependencies (`npm install`) and runs the app locally. They will need their own API key in a `.env` file.
2. #strong[Deploy to the web.] Ask OpenCode to deploy the app to a free hosting service like Vercel or Netlify. This makes it accessible via a URL. Be careful: a web-deployed app that uses a cloud API means data leaves your firm's network.
3. #strong[Use Copilot Studio.] If the tool is a Copilot Studio agent, share it through your Microsoft 365 admin centre. Colleagues access it through Teams or Word.
4. #strong[Docker container.] For more technical teams, ask OpenCode to create a Docker image. This packages the app and all its dependencies into a single file that runs the same way on any machine.

== "The AI keeps hallucinating legal citations"

Hallucination is the most dangerous behaviour for legal work. Here is how to reduce it:

1. Add explicit instructions: "Only cite cases and statutes that you are confident exist. If you are unsure, say so rather than guessing."
2. Use RAG: connect the model to a legal database so it retrieves real sources instead of generating from memory.
3. Add a verification step: ask the model to provide a source URL or paragraph number for every citation. Then check them.
4. Use reasoning models like DeepSeek R1, which are less prone to confident fabrication than fast models.
5. Always, without exception, verify every citation against a primary source before relying on it in client work.
