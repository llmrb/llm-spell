# frozen_string_literal: true

require_relative "setup"

RSpec.describe LLM::Spell::Text do
  context "with OpenAI", vcr: {cassette_name: "text/openai/spell_check"} do
    let(:llm) { LLM.openai(key: ENV["OPENAI_SECRET"]) }
    let(:text) { described_class.new("Ths is a smple txt with sme erors.", llm) }

    describe "#mistakes" do
      it "returns an array of mistakes" do
        expect(text.mistakes).to eq(["Ths", "smple", "txt", "sme", "erors"])
      end
    end

    describe "#corrections" do
      it "returns an array of corrections" do
        expect(text.corrections).to eq(["This", "simple", "text", "some", "errors"])
      end
    end
  end
end