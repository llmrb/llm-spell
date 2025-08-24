# frozen_string_literal: true

class LLM::Spell
  class Document
    attr_reader :text, :llm, :bot

    ##
    # @param [String] text
    #  The contents of the document
    # @param [LLM::Provider] provider
    #  An instance of LLM::Provider
    def initialize(text:, llm:)
      @text = text
      @llm = llm
      @bot = LLM::Bot.new(llm, schema:)
    end

    def mistakes = response["mistakes"].uniq
    def corrections = response["corrections"].uniq

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
        bot.chat text, role: :user
        bot.messages.find(&:assistant?).content!
      end
    end
  end
end
