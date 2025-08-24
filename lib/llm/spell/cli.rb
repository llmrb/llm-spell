# frozen_string_literal: true

class LLM::Spell
  class CLI
    attr_reader :text, :content

    def initialize(text)
      @text = text
    end

    def start
      say "please wait"
      if text.mistakes.empty?
        say "no mistakes found"
      else
        text.mistakes.each.with_index do |mistake, i|
          correction = text.corrections[i]
          print "#{mistake} => #{correction}", "\n"
          print "Replace? (y/N): "
          res = $stdin.gets
          @text.text.gsub!(mistake, correction) if res&.strip&.downcase == "y"
          print "\n"
        end
      end
      @text
    end

    private

    def say(*messages)
      print "llm-shell: ", *messages, "\n"
    end
  end
end