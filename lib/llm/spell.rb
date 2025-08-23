# frozen_string_literal: true

require "llm"
require "readline"

class LLM::Spell
  require_relative "spell/version"
  require_relative "spell/document"

  def initialize(options)
    @options = options
  end

  def start
    @content = File.read(@options[:file])
    document = Document.new(@content, @options)
    if document.mistakes.empty?
      print "No spelling mistakes found.", "\n"
    else
      document.mistakes.each.with_index do |mistake, i|
        correction = document.corrections[i]
        print "#{mistake} => #{correction}", "\n"
        reply = Readline.readline("Replace? (y/N): ")
        @content.gsub!(mistake, correction) if reply&.strip&.downcase == "y"
      end
      File.write(@options[:file], @content)
    end
  end
end
