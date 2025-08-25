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

  ##
  # @param [Hash] options
  # @return [LLM::Spell]
  def initialize(options)
    @options = options
    @text = Text.new(File.read(@options[:file]), llm, bot_options)
  end

  ##
  # Run in interactive mode
  # @return [void]
  def interactive
    if mime_types.include?(LLM::Mime[file])
      File.write file, CLI.new(@text).start
    else
      raise Error, "In interactive mode, the following mime types " \
                   "are supported: #{mime_types.join(', ')}"
    end
  end

  private

  def provider_options
    if @options[:key]
      {key: @options[:key]}
    elsif File.readable?(config_file)
      config[provider.to_s]
        .transform_keys(&:to_sym)
        .slice(:key, :host, :port)
    else
      raise Error, "No API key available"
    end
  end

  def bot_options
    @options.slice(:model)
  end

  def llm = @llm ||= LLM.method(provider).call(**provider_options)
  def provider = @options[:provider]
  def config_dir = ENV["XDG_CONFIG_HOME"] || File.join(Dir.home, ".config")
  def config_file = File.join(config_dir, "llm-spell.yml")
  def config = @config ||= YAML.load_file(config_file)
  def file = @options[:file]
  def mime_types = ["text/plain", "text/markdown"]
end
