## About

llm-spell is both a library and command-line utility that
corrects spelling mistakes using a Large Language Model (LLM).
While often slower than traditional spell checkers like `aspell`
and `hunspell`, `llm-spell` provides significantly more accurate
suggestions with far fewer false positives &ndash; eliminating
the need to manually ignore irrelevant corrections, and that
usually makes it worth the wait.

## Features

- ✨ **LLM-powered corrections** – smarter spelling fixes than traditional tools
- 🤖 **Fewer false positives** – avoids flagging uncommon but valid words
- 🌐 **Broad provider support** – use OpenAI, Gemini, or xAI (Grok) out of the box
- 💻 **Offline ready** – run locally with Ollama and LlamaCpp, no cloud required
- 🔒 **Privacy** – keep sensitive text local with offline models
- 🛠️ **Easy to use** – provides an easy to use library and command-line utility

## Library

```ruby
#!/usr/bin/env ruby
require "llm"
require "llm/spell"

##
# Text
llm  = LLM.openai(key: ENV["OPENAI_SECRET"])
text = LLM::Spell::Text.new("Ths is a smple txt with sme speling erors.", llm)
print "mistakes: ", text.mistakes, "\n"
print "corrections: ", text.corrections, "\n"

##
# PDF
llm  = LLM.openai(key: ENV["OPENAI_SECRET"])
file = LLM::Spell::Document.new("typos.pdf", llm)
print "mistakes: ", file.mistakes, "\n"
print "corrections: ", file.corrections, "\n"
```

## Demo

<details>
  <summary>Start demo</summary>
  <img src="demo.gif" alt="Demo of llm-spell in action" />
</details>

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/)
<br>
See [LICENSE](./LICENSE)

