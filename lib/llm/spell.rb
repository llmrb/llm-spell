# frozen_string_literal: true

module LLM
end unless defined?(LLM)

class LLM::Spell
  require "llm"
  require "yaml"
  require_relative "spell/version"
  require_relative "spell/engine"
  require_relative "spell/document"
  require_relative "spell/text"
  require_relative "spell/cli"

  ##
  # The superclass of all LLM::Spell errors
  Error = Class.new(RuntimeError)

  def initialize(options)
    @options = options
    @text = Text.new(File.read(@options[:file]), llm)
  end

  def interactive
    File.write @options[:file], CLI.new(@text).start
  end

  private

  def options
    if @options[:key]
      {key: @options[:key]}
    elsif File.readable?(config_file)
      config[provider.to_s].transform_keys(&:to_sym)
    else
      raise Error, "No API key available"
    end
  end

  def llm = @llm ||= LLM.method(provider).call(**options)
  def provider = @options[:provider]
  def config_dir = ENV["XDG_CONFIG_HOME"] || File.join(Dir.home, ".config")
  def config_file = File.join(config_dir, "llm-spell.yml")
  def config = @config ||= YAML.load_file(config_file)
end
