# frozen_string_literal: true

class LLM::Spell
  class Document
    def initialize(text, options)
      @text = text
      @options = options
    end

    def mistakes = response["mistakes"]
    def corrections = response["corrections"]

    private

    def prompt
      "Your task is to find spelling mistakes in the user's input and provide corrections."
    end

    def schema
      llm.schema.object(
        mistakes: llm.schema.array(llm.schema.string.required),
        corrections: llm.schema.array(llm.schema.string.required)
      )
    end

    def response
      @response ||= begin
        bot.chat prompt, role: :user
        bot.chat @text, role: :user
        bot.messages.find(&:assistant?).content!
      end
    end

    def llm = @llm ||= LLM.method(provider).call(key:)
    def bot = @bot ||= LLM::Bot.new(llm, schema:)
    def key = @options[:key] || ENV["LLM_SPELL_KEY"]
    def provider = @options[:provider]
  end
end
