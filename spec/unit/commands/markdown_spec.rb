# frozen_string_literal: true

require 'poc_sample_commands/commands/markdown'

RSpec.describe PocSampleCommands::Commands::Markdown do

  let(:subcommand) { nil }
  let(:options) { {} }
  subject { PocSampleCommands::Commands::Markdown.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `markdown` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq("OK\n")
    end
  end

  describe 'execute' do
    before { subject.execute }

    context 'with XYZ' do
    end
  end
end
