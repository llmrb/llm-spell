# frozen_string_literal: true

require_relative "setup"

RSpec.describe LLM::Spell::Document do
  context "with OpenAI", vcr: {cassette_name: "document/openai/spell_check"} do
    let(:llm) { LLM.openai(key: ENV["OPENAI_SECRET"]) }
    let(:doc) { described_class.new("typos.pdf", llm) }

    describe "#mistakes" do
      it "returns an array of mistakes" do
        expect(doc.mistakes).to eq(["fil", "lotz", "typo'z", "tha", "ned", "b", "fixt"])
      end
    end

    describe "#corrections" do
      it "returns an array of corrections" do
        expect(doc.corrections).to eq(["file", "lots", "typos", "that", "need", "be", "fixed"])
      end
    end
  end
end