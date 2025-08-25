## About

llm-spell is both a library and command-line utility that
corrects spelling mistakes using a Large Language Model (LLM).
It is powered by [llm.rb](https://github.com/llmrb/llm).

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

#### Configuration

The command line interface can be configured through the configuration file
located at `$XDG_CONFIG_HOME/llm-spell.yml` or `~/.config/llm-spell.yml`. This
step is required to use llm-spell from the command line but it is not required
when using llm-shell as a library:

```yaml
# ~/.config/llm-spell.yml
openai:
  key: YOURKEY
gemini:
  key: YOURKEY
xai:
  key: YOURKEY
ollama:
  host: localhost
  model: gpt-oss
llamacpp:
  host: localhost
```

#### Usage

```sh
Usage: llm-spell [OPTIONS]
    -p, --provider NAME              Required. Options: gemini, openai, xai, ollama or llamacpp.
    -f, --file FILE                  Required. The file to check.
    -v, --version                    Optional. Print the version and exit.
```

## Demo

<details>
  <summary>Start demo</summary>
  <img src="share/llm-spell/demo.gif" alt="Demo of llm-spell in action" />
</details>

## Install

llm-spell requires Ruby 3.2+ and can be installed via RubyGems:

    gem install llm-spell

## Background

This project was born while I was working on the documentation
for a friend's open source project. After realizing how much
manual effort was involved with traditional spell checkers I
decided to see if I could leverage LLMs to make the process
easier and also faster.

Compared to traditional spell checkers like `aspell` and `hunspell`,
`llm-spell` provides significantly more accurate suggestions with
far fewer false positives &ndash; eliminating the need to manually
ignore irrelevant corrections, and that often reduces the overall
time spent on correcting spelling mistakes.

I would call the experiment a success but I also realize this
approach is not for everyone, or every situation. For example,
my friend preferred to not use AI for this and instead we opted
to stick with `hunspell` &ndash; even though it meant more
manual work.

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/)
<br>
See [LICENSE](./LICENSE)

