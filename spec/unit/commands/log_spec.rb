# frozen_string_literal: true

require 'poc_sample_commands/commands/log'

RSpec.describe PocSampleCommands::Commands::Log do

  let(:subcommand) { nil }
  let(:options) { {} }
  subject { PocSampleCommands::Commands::Log.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `log` command successfully' do
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
