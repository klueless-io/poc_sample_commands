# frozen_string_literal: true

require 'poc_sample_commands/commands/setup'

RSpec.describe PocSampleCommands::Commands::Setup do

  before(:all) {
    @tmp_dir = Dir.tmpdir
  }

  let(:folder) { File.join(@tmp_dir, 'sample_folder') }
  let(:options) { {} }
  let(:instance) { PocSampleCommands::Commands::Setup.new(folder, options) }

  subject { instance }

  describe 'initialize' do
    # context 'with default setup' do
    #   let(:folder) { nil }
    #   it 'executes `setup` command successfully' do
    #     output = StringIO.new

    #     subject.execute(output: output)

    #     expect(output.string).to eq("invalid sample folder\n")
    #   end
    # end
    context 'with sample folder' do
      it 'should have a sample folder stored in config' do
        expect(subject.app.sample_folder).to eq(folder)
      end
    end
  end

  describe 'execute' do
    # let(:file) { nil }
    # let(:expected_file_path) { File.join(folder, file) }

    before { instance.execute }
    
    # subject { File.exist?(expected_file_path) }

    # context 'with samples for file command' do
    #   # context 'with sample image file' do
    #   #   let(:file) { 'sample.png' }
    #   #   it { is_expected.to be_truthy }
    #   # end
    #   context 'with sample text file' do
    #     let(:file) { 'sample.txt' }
    #     it { is_expected.to be_truthy }
    #   end
    # end

    it 'should have a sample folder in temp folder' do
      # puts subject.sample_folder
      expect(Dir.exist?(subject.app.sample_folder)).to be_truthy
    end

  end
end
