# frozen_string_literal: true

class LLM::Spell
  ##
  # The {LLM::Spell::Text LLM::Spell::Text} class can analyze a given
  # piece of text and return any spelling mistakes it found &ndash; along
  # with suggested corrections.
  class Text
    include LLM::Spell::Engine

    ##
    # @param [String] text
    #  The contents of the Text
    # @param [LLM::Provider] provider
    #  An instance of LLM::Provider
    def initialize(input, llm)
      @input = input
      @llm = llm
      @bot = LLM::Bot.new(llm, schema:)
    end

    def to_s = text
    def to_str = text
  end
end
