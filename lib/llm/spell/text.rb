# frozen_string_literal: true

class LLM::Spell
  ##
  # The {LLM::Spell::Text LLM::Spell::Text} class can analyze a given
  # piece of text and return any spelling mistakes it found &ndash; along
  # with suggested corrections.
  class Text
    ##
    # @param [String] text
    #  The contents of the Text
    # @param [LLM::Provider] provider
    #  An instance of LLM::Provider
    def initialize(text, llm)
      @text = text
      @llm = llm
      @bot = LLM::Bot.new(llm, schema:)
    end

    ##
    # @return [Array<String>]
    #  An array of unique spelling mistakes found in the text
    def mistakes
      response["mistakes"].uniq
    end

    ##
    # @return [Array<String>]
    #  An array of unique corrections corresponding to the mistakes
    def corrections
      response["corrections"].uniq
    end

    def to_s = text
    def to_str = text
    def inspect = "#<#{self.class}:0x#{object_id.to_s(16)} " \
                  "mistakes=#{mistakes.size} corrections=#{corrections.size}>"

    private

    attr_reader :text, :llm, :bot

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
