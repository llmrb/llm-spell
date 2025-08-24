# frozen_string_literal: true

class LLM::Spell
  module Engine
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

    ##
    # @return [String]
    def inspect = "#<#{self.class}:0x#{object_id.to_s(16)} " \
                  "mistakes=#{mistakes.size} corrections=#{corrections.size}>"

    private

    attr_reader :input, :llm, :bot

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
        bot.chat input, role: :user
        bot.messages.find(&:assistant?).content!
      end
    end
  end
end