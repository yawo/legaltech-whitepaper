#import "utils.typ": part, chapter-image

#part[Getting Your Free AI Keys]

#chapter-image("./images/ch3-google-ai.jpg")

= Google AI Studio: your first free API key

Before you can build anything, you need a key. Not a physical key. An API key: a string of characters that lets your tools talk to an AI model over the internet.

Think of it like a password for a service. You give the password to an app you trust, and the app uses it to access the AI on your behalf. Without the key, the AI will not respond. With it, you can send prompts and receive answers, build tools, and automate work.

This chapter walks you through getting your first key from Google AI Studio. It takes about two minutes.

== What an API key unlocks

Google AI Studio gives you access to the Gemini family of models. The free tier includes Gemini 2.5 Pro, which has a context window of one million tokens. That is enough to feed in a lengthy contract and ask questions about it without hitting a size limit.

A token is roughly a word or a piece of a word. One million tokens is approximately 750,000 words, or about 1,500 pages of text. For most legal documents, that is more than enough.

The free tier has rate limits: a cap on how many requests you can send per minute and per day. For building and testing tools, the free tier is sufficient. If you later need higher limits, you can upgrade to a paid plan. But start free.

== Step-by-step: getting your Gemini key

1. Open your browser and go to https://aistudio.google.com.

2. Sign in with your Gmail account. If you do not have one, create one. It is free.

3. On the left sidebar, click "Get API key." If you do not see it, look for a button labelled "Create API key in new project."

4. Google Cloud will create a project for you and generate a key. It will look something like `AIzaSyD...` followed by a long string of random characters.

5. Copy the key immediately. Store it in a password manager. If you lose it, you can generate a new one, but you will need to update every tool that used the old one.

6. Check your free quota limits. In Google AI Studio, navigate to the pricing or quota page to see how many requests per minute and per day the free tier allows. As of 2026, the free tier of Gemini 2.5 Pro allows a generous number of requests per day, enough for development and testing.

That is it. You now have a key. Do not share it. Do not paste it into public websites or email it to colleagues. Treat it like a password.

== Testing your key (no code required)

Google AI Studio has a built-in playground where you can test your key without writing a single line of code.

1. In Google AI Studio, click "Create new" or "Chat" from the left sidebar.

2. A chat interface appears. In the model dropdown, select "Gemini 2.5 Pro."

3. In the system instructions or the chat box, type a legal prompt. For example:

   "Summarise the key termination clauses in the following contract excerpt. Identify any unusual provisions."

4. Paste a short contract clause below the prompt.

5. Press Enter. The model will respond with a summary.

If it works, your key is active and the model is responding. If you get an error, check that you are signed in, that your key is valid, and that you have not exceeded your rate limit.

== Understanding rate limits and the free tier

Every free API has limits. Google's free tier for Gemini allows a certain number of requests per minute and per day. If you exceed the per-minute limit, you will get a brief error and can retry moments later. If you exceed the daily limit, you will need to wait until the next day or upgrade.

For the work in this guide, building and testing legal tools, the free tier is enough. You are not running a production service with thousands of users. You are a lawyer building a tool for yourself or your firm. The free tier supports that.

If you find yourself hitting limits regularly, two options: upgrade to Google's paid tier, or use OpenRouter (covered in the next chapter) to access additional models with their own free quotas.

/*
 *#chapter-image("./images/ch4-openrouter.jpg")
 */

= OpenRouter: one key, 75+ free models

Google's key gives you access to Gemini. OpenRouter gives you access to almost everything else, through a single key and a single interface.

== Why OpenRouter changes everything

OpenRouter is a unified API gateway. Instead of signing up for Google, Anthropic, Meta, and DeepSeek separately, you create one OpenRouter account, get one key, and use it to access models from all of them.

As of 2026, OpenRouter offers access to over 75 models. Many of them are free. No credit card is required to get started. You create an account, generate a key, and begin.

The free models are not stripped-down demos. They are the same model weights as the paid versions, subject to rate limits and slightly higher latency during peak hours. For building and testing legal tools, they are more than capable.

== Step-by-step: creating your OpenRouter key

1. Go to https://openrouter.ai.

2. Click "Sign In." You can sign up with a Google account or an email address. No credit card is required.

3. Once logged in, click your profile icon in the top right corner. Select "Keys" from the dropdown menu.

4. Click "Create Key." Give it a name that will help you remember its purpose. "Legal-tools" works fine.

5. Click "Create." OpenRouter generates a key that looks like `sk-or-v1-...` followed by a long string.

6. Copy the key immediately. OpenRouter only shows it once. If you close the window without copying it, you will need to generate a new key.

7. Store the key in a password manager or a `.env` file on your machine. Never hardcode it in a script or share it in an email.

You now have access to the full OpenRouter catalogue. To stay on the free tier, you do not need to add any credits. Free models work with a zero balance.

== Choosing the right free model for legal work

Not all models are equally good at all tasks. Here is a comparison of the most useful free models on OpenRouter for legal work as of 2026:

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  [Model], [Best for], [Context window], [Notes],
  [DeepSeek R1], [Reasoning, analysis, complex questions], [64K], [Slower but thorough. Good for contract analysis.],
  [DeepSeek Chat V3], [General chat, drafting, summarisation], [64K], [Faster than R1. Good all-rounder.],
  [Llama 4 Maverick], [Long documents, multimodal tasks], [1M], [Best free option for very large documents.],
  [Qwen3 235B], [Coding, structured extraction], [128K], [Strong for building tools that process data.],
  [Gemini 2.5 Flash], [Fast responses, large context], [1M], [Google's fast model. Good for quick tasks.],
  [Mistral Small 3.1], [Writing, balanced tasks], [128K], [Reliable and fast. Good default choice.],
  [Grok 3 Mini], [Fast, lightweight reasoning], [131K], [Optimised for speed over depth.],
)

=== When to use a reasoning model

DeepSeek R1 is a reasoning model. It "thinks" before it answers, working through the problem step by step. This makes it slower than other models, but more accurate for complex legal questions.

Use R1 when you are asking the model to analyse a contract, compare clauses, or reason through a legal problem. Use a faster model like Gemini Flash or Mistral Small when you need a quick summary or a draft.

=== When context window matters

The context window is how much text the model can consider at once. If you are analysing a 200-page lease agreement, you need a model with a large context window. Llama 4 Maverick and Gemini 2.5 Flash both offer one million tokens, enough for the longest contracts you will encounter.

If your document is shorter than about 50 pages, any model on the list will handle it.

=== A practical starting point

If you are unsure which model to pick, start with DeepSeek Chat V3 for general tasks and switch to DeepSeek R1 when you need deeper analysis. For tools that process long documents, use Llama 4 Maverick or Gemini 2.5 Flash.

You can change models at any time. The key stays the same. You just tell OpenRouter which model to use for each request.

== Keeping your key safe

Your OpenRouter key is a credential. Anyone who has it can use your account, consume your free quota, or run up charges if you have added credits.

Three rules:

1. Store it in a password manager or a `.env` file, never in the code itself.

2. If you accidentally expose it (pushed it to a public repository, pasted it in a chat), regenerate a new key immediately from the OpenRouter dashboard and delete the old one.

3. Add optional headers to your requests (`HTTP-Referer` and `X-Title`) so you can track which project is using your quota in the OpenRouter activity dashboard.

With your Google AI Studio key and your OpenRouter key, you now have access to the most powerful free AI models available. The next part of this guide shows you how to set up the tool that uses these keys to build legal applications.
