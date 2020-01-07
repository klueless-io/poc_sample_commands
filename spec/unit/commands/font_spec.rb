# frozen_string_literal: true

require 'poc_sample_commands/commands/font'

RSpec.describe PocSampleCommands::Commands::Font do

  let(:subcommand) { nil }
  let(:options) { {} }
  subject { PocSampleCommands::Commands::Font.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `font` command successfully' do
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
