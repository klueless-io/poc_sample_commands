# frozen_string_literal: true

require 'poc_sample_commands/commands/file'

RSpec.describe PocSampleCommands::Commands::File do

  let(:subcommand) { nil }
  let(:options) { {} }
  subject { PocSampleCommands::Commands::File.new(subcommand, options) }

  it 'executes `file` command successfully' do
    output = StringIO.new

    subject.execute(output: output)

    expect(output.string).to eq('') # eq("OK\n")
    expect(subject.is_binary).to be_falsey
  end

  context 'subcommands' do
    before { subject.execute }

    context 'with copy file' do
      let(:subcommand) { :copy_file }

      it 'should copy sample.txt' do
        expect(::File.exist?(File.join(subject.app.sample_folder, 'sample.txt'))).to be_truthy
      end
    end

    context 'with remove file' do
      let(:subcommand) { :remove_file }

      it 'should copy sample.txt' do
        expect(::File.exist?(File.join(subject.app.sample_folder, 'sample.txt'))).to be_falsey
      end
    end

    context 'with binary?' do
      let(:subcommand) { :binary }

      it 'should check that sample.png is binary?' do
        expect(subject.is_binary).to be_truthy
      end
    end
  end
end
