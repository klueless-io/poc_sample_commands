# frozen_string_literal: true

require 'poc_sample_commands/commands/table'

RSpec.describe PocSampleCommands::Commands::Table do

  let(:subcommand) { nil }
  let(:options) { {} }
  subject { PocSampleCommands::Commands::Table.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `table` command successfully' do
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
