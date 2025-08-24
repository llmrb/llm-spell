# frozen_string_literal: true

class LLM::Spell
  class CLI
    attr_reader :document, :content

    def initialize(document)
      @document = document
      @text = document.text.dup
    end

    def start
      if document.mistakes.empty?
        print "No spelling mistakes found.", "\n"
      else
        document.mistakes.each.with_index do |mistake, i|
          correction = document.corrections[i]
          print "#{mistake} => #{correction}", "\n"
          reply = Readline.readline("Replace? (y/N): ")
          @text.gsub!(mistake, correction) if reply&.strip&.downcase == "y"
          print "\n"
        end
      end
      @text
    end
  end
end