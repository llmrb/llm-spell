# frozen_string_literal: true

require "llm"

class LLM::Spell
  require_relative "spell/version"
  require_relative "spell/engine"
  require_relative "spell/file"
  require_relative "spell/text"
  require_relative "spell/cli"

  def initialize(options)
    @options = options
    @text = Text.new(File.read(@options[:file]), llm)
  end

  def interactive
    File.write @options[:file], CLI.new(@text).start
  end

  private

  attr_reader :options, :content, :text

  def llm = @llm ||= LLM.method(provider).call(key:)
  def key = @options[:key] || ENV["LLM_SPELL_KEY"]
  def provider = @options[:provider]
end
