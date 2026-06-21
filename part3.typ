#import "utils.typ": part, promptbox, chapter-image

#part[Setting Up Your Vibe Coding Environment]

#chapter-image("./images/ch5-vibe-coding.jpg")

= Installing OpenCode: the free Cursor alternative

You type a sentence in plain English. Three minutes later, you have a working web application. No syntax errors to debug, no Stack Overflow tabs to open, no computer science degree required. That is the promise of OpenCode, and unlike most promises in the AI space, it largely delivers.

OpenCode is an open-source AI coding agent that runs in your terminal. It is not a plugin for VS Code or a web app you sign up for. It is a standalone program that opens a text-based interface, connects to your chosen AI model through the keys you already have, and builds software based on plain English instructions.

As of 2026, OpenCode has over 167,000 GitHub stars. It is MIT licensed, which means it is free to use, modify, and distribute. It supports 75+ AI models across every major provider: Anthropic, OpenAI, Google, OpenRouter, and local models through Ollama.

Most importantly for this guide, it was built around the idea that you should review a plan before any code gets written. That philosophy aligns well with how lawyers already work: think before you act, review before you file.

== What OpenCode is and why it matters

OpenCode is a terminal-first AI coding agent. When you launch it, you get a clean text interface inside your terminal window. You type a request in plain English. OpenCode reads your project files, formulates a plan, and (when you approve) writes code, creates files, runs commands, and tests the result.

It is not the only tool that does this. Claude Code and OpenAI's Codex CLI are alternatives. What makes OpenCode different is three things:

#strong[Provider freedom.] Claude Code only works with Anthropic models. Codex CLI only works with OpenAI. OpenCode works with 75+ models across every provider. You are not locked in.

#strong[Open source.] The code is publicly auditable. You can see exactly what it does with your files and your data. For lawyers handling sensitive matters, that transparency is not optional.

#strong[Price.] The core agent costs nothing. You pay only for API usage to your chosen provider, and only when you use it. There is no subscription, no premium tier, no feature gate.

== Two modes: plan before you build

Every OpenCode session runs in one of two modes, switchable with the Tab key:

#strong[Plan mode] is read-only. OpenCode analyses your codebase, drafts what it intends to do, and presents the plan for review. It does not touch any files. You read the plan, push back on anything that looks wrong, and refine until you are satisfied.

#strong[Build mode] is where OpenCode executes. It reads files, writes code, runs shell commands, and makes the changes you approved in Plan mode.

This design solves the most common problem with AI coding agents: they dive into changes you did not ask for and keep going when you try to stop them. Making "plan then execute" a built-in concept, not a prompting trick, is one of OpenCode's better decisions.

There are also three specialised modes: Debug (investigation only), Review (code review only), and Docs (reads and writes documentation files).

== Installation on Mac (step-by-step)

This section assumes no prior command-line experience. If you have never opened Terminal, that is fine.

1. Open Terminal. Press Cmd+Space to open Spotlight, type "Terminal," and press Enter. A white or black window appears.

2. Install Homebrew if you do not have it. Homebrew is a package manager that makes installing developer tools easy. Paste this command and press Enter:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the prompts. It will ask for your Mac password.

3. Install Node.js:

```
brew install node
```

4. Install OpenCode:

```
npm install -g opencode-ai
```

5. Launch OpenCode:

```
opencode
```

On first launch, OpenCode prompts you to configure a provider. Enter your OpenRouter or Gemini API key when asked.

6. Verify it works. At the prompt, type:

#promptbox[
  Explain what you can do in this project.
]

OpenCode should respond. If it does, you are set up.

== Installation on Windows (step-by-step)

1. Download Node.js from https://nodejs.org. Choose the LTS version. Run the installer and accept the defaults.

2. Open PowerShell as Administrator. Right-click the Start button and select "Windows PowerShell (Admin)" or "Terminal (Admin)."

3. Install OpenCode:

```
npm install -g opencode-ai
```

4. Launch it:

```
opencode
```

5. Enter your API key when prompted.

6. Optional: install Windows Terminal from the Microsoft Store for a better experience. It supports tabs, better fonts, and a more readable display than the default PowerShell window.

== First run: the OpenCode interface explained

When you launch OpenCode, you see a terminal interface with a prompt at the bottom. This is where you type your requests.

The basic interaction loop:

1. Type a request. For example: "Build me a simple web app where I can upload a PDF and ask questions about it."

2. OpenCode analyses your project (or creates a new directory if the project does not exist yet).

3. If you are in Plan mode (check the status bar), OpenCode drafts a plan. Read it. Ask questions. Request changes.

4. When you are satisfied, press Tab to switch to Build mode. OpenCode executes the plan.

5. Test the result. If something is wrong, describe the fix. OpenCode adjusts.

6. Save your session. OpenCode persists sessions in SQLite, so you can close the terminal and resume later.

Useful commands:

- `/undo` undoes the last change.
- `/redo` restores an undone change.
- `@` followed by text searches for files in your project.
- `Tab` switches between Plan and Build mode.

== Understanding what OpenCode is good at

OpenCode excels at building web applications from natural language descriptions. Say "build me a contract review tool" and it will scaffold a working app: HTML front end, a backend to handle file uploads, integration with your chosen AI model, and a simple interface for asking questions about uploaded documents.

It is less good at tasks that require deep domain expertise it does not have. It does not know UK contract law. It does not know your firm's precedent database. It does not know the difference between a reasonable and an unreasonable indemnity clause unless you tell it.

That is where your job comes in. You provide the legal context, review the output, and iterate. OpenCode handles the plumbing: the code, the file structure, the API integration, the debugging.

== The honest trade-offs

OpenCode is powerful, but it is not magic. Here is what to expect:

#strong[Iteration is the process.] The first version will rarely be perfect. You will need to test, describe what is wrong, and ask for changes. This is normal. It is how all software gets built, with or without AI.

#strong[Slower than Claude Code.] Independent testing by Builder.io found OpenCode is roughly 78% slower than Claude Code on identical tasks using the same model. The extra time comes from OpenCode's LSP integration, which checks the code against a real compiler before committing to changes. For correctness, that trade-off is worth it.

#strong[Terminal-only.] OpenCode runs in a terminal. There is no graphical interface, no inline code completion, no visual diff viewer. If you prefer a GUI, consider VS Code with GitHub Copilot (covered in the next chapter). But for the work in this guide, the terminal is sufficient.

#strong[Configuration required.] OpenCode does not work perfectly out of the box. You need to configure your provider, set your API key, and optionally create an `AGENTS.md` file in your project to give OpenCode context about what you are building. The first-time setup takes about five minutes.

/*
 *#chapter-image("./images/ch6-vscode.jpg")
 */

= Optional: VS Code + GitHub Copilot (free tier)

The blinking cursor in a black terminal window is not everyone's idea of a good time. If you have never used a command line, OpenCode's interface can feel like being handed the controls of a plane mid-flight. This chapter is for you.

VS Code with GitHub Copilot gives you the same AI assistance through a familiar graphical interface. Files in a sidebar. Code in a window. Suggestions that appear as you type. It is less powerful than OpenCode for building entire applications from scratch, but it is more comfortable for many lawyers, and comfort matters when you are learning something new.

== When to use VS Code instead of OpenCode

Choose VS Code if:

- You prefer a graphical interface over a terminal.
- You want to see files, folders, and code in a visual editor.
- You want inline code suggestions as you type (Copilot's autocomplete).
- You are already comfortable with VS Code or another code editor.

Choose OpenCode if:

- You want the most powerful AI coding agent available for free.
- You need access to 75+ models across multiple providers.
- You prefer a terminal workflow.
- You want the Plan/Build mode separation.

You can use both. Many developers run OpenCode in VS Code's integrated terminal, getting the best of both worlds.

== Quick setup

1. Download VS Code from https://code.visualstudio.com. It is free.

2. Open VS Code. Click the Extensions icon on the left sidebar (or press Cmd+Shift+X on Mac, Ctrl+Shift+X on Windows).

3. Search for "GitHub Copilot." Click Install.

4. Sign in with a free GitHub account. If you do not have one, create one at github.com.

5. To connect your OpenRouter key: open VS Code settings, search for "Copilot Chat," and look for the provider settings. You can configure OpenRouter as a custom provider.

6. Open a folder (File → Open Folder) and start working. Copilot will suggest code as you type. Copilot Chat (accessible from the sidebar) lets you describe tasks in plain English, similar to OpenCode.

== What the free tier includes

GitHub Copilot's free tier provides 2,000 code completions per month and a limited number of chat interactions. For the tutorials in this guide, that is enough to get started. If you find yourself hitting limits, you can upgrade to the paid tier (\$10/month) or use OpenCode with your OpenRouter key for unlimited access to free models.

== A note on what VS Code cannot do

VS Code with Copilot is an excellent code editor with AI assistance. It is not the same as OpenCode. Copilot suggests code as you type and answers questions in a chat panel. It does not independently plan and execute multi-file projects the way OpenCode does.

For the tutorials in Chapters 8 through 11, OpenCode is the recommended tool. It can take a single plain English request and build an entire working application. Copilot can help you write and edit code, but you will need to do more of the architectural thinking yourself.

#emph[Note: Statistics and performance claims in this chapter are drawn from vendor documentation and third-party testing referenced in the outline. TODO: verify against primary sources before publication.]

If you are comfortable in a terminal, use OpenCode. If you are not, start with VS Code and migrate to OpenCode when you are ready. Either way, you will be building legal tools by the end of Part 4.
