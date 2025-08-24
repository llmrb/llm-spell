## About

llm-spell is both a library and command-line utility that can correct
spelling mistakes with the help of a Large Language Model (LLM). Compared
to traditional spell checkers like `aspell` and `hunspell`, llm-spell
often produces fewer false positives and more accurate suggestions.

## Features

- ✨ **LLM-powered corrections** – smarter spelling fixes than traditional tools
- 🤖 **Fewer false positives** – avoids flagging uncommon but valid words
- 🌐 **Broad provider support** – use OpenAI, Gemini, or xAI (Grok) out of the box
- 💻 **Offline ready** – run locally with Ollama and LlamaCpp, no cloud required
- 🔒 **Privacy** – keep sensitive text local with offline models
- 🛠️ **Easy to use** – simple command-line interface for quick checks

## Library

```ruby
#!/usr/bin/env ruby
require "llm"
require "llm/spell"

llm = LLM.openai(key: ENV["OPENAI_SECRET"])
doc = LLM::Spell::Text.new("Ths is a smple txt with sme speling erors.", llm)
print "mistakes: ", doc.mistakes, "\n"
print "corrections: ", doc.corrections, "\n"
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


