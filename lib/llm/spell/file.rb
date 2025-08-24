# frozen_string_literal: true

class LLM::Spell
  ##
  # The {LLM::Spell::File LLM::Spell::File} class can analyze a given
  # text file or document, and return any spelling mistakes that were
  # found &ndash; along with suggested corrections.
  class File
    include LLM::Spell::Engine

    ##
    # @param [File] input
    #  The file to be analyzed
    # @param [LLM::Provider] provider
    #  An instance of LLM::Provider
    # @return [LLM::Spell::File]
    def initialize(input, llm)
      @input = input
      @llm = llm
      @bot = LLM::Bot.new(llm, schema:)
    end
  end
end