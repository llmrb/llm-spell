# frozen_string_literal: true

require "llm"
require "readline"

class LLM::Spell
  require_relative "spell/version"
  require_relative "spell/document"
  require_relative "spell/cli"

  def initialize(options)
    @options = options
    @content = File.read(@options[:file])
    @document = Document.new(text: @content, llm:)
  end

  def interactive
    File.write @options[:file], CLI.new(@document).start
    print "File updated.", "\n"
  end

  private

  attr_reader :options, :content, :document

  def llm = @llm ||= LLM.method(provider).call(key:)
  def key = @options[:key] || ENV["LLM_SPELL_KEY"]
  def provider = @options[:provider]
end
