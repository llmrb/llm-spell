## About

llm-spell is both a library and command-line utility that
corrects spelling mistakes using a Large Language Model (LLM).
It is powered by [llm.rb](https://github.com/llmrb/llm).

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

## CLI

### Configuration

The command line interface can be configured through the configuration file
located at `$XDG_CONFIG_HOME/llm-spell.yml` or `~/.config/llm-spell.yml`. It
is also possible to provide the configuration at the command-line, but usually
it's more convenient to use the configuration file:

```yaml
# ~/.config/llm-shell.yml
openai:
  key: YOURKEY
gemini:
  key: YOURKEY
xai:
  key: YOURKEY
ollama:
  host: localhost
llamacpp:
  host: localhost
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

