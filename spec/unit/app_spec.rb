# frozen_string_literal: true

require 'poc_sample_commands/app'

RSpec.describe PocSampleCommands::App do

  before(:all) {
    # @tmp_config_file = Tempfile.new('poc_sample_commands').path
    # @tmp_dir = File.dirname(@tmp_config_file)
    @tmp_dir = Dir.tmpdir
  }

  let(:config) { PocSampleCommands::App.config }

  before do
    config.append_path @tmp_dir
  end

  it 'should have config object' do
    expect(config).to_not be_nil
  end

  # it 'should print some data' do
  #   puts @tmp_config_file
  #   puts @tmp_dir
  #   puts config.filename
  #   puts config.extname
  #   puts config.persisted?
  #   puts PocSampleCommands::App.sample_folder
  #   puts PocSampleCommands::App.relative_template_folder
  # end

  it 'should set sample folder' do
    config.set(:sample_folder, value: @tmp_dir)
    expect(config.fetch(:sample_folder)).to eq(@tmp_dir)
    config.write force: true
  end

  it 'should have persisted sample folder' do
    config.set(:sample_folder, value: @tmp_dir)
    config.write force: true
    expect(config.persisted?).to be_truthy
    expect(config.fetch(:sample_folder)).to eq(@tmp_dir)
  end

  it 'should have default relative template folder' do
    expect(config.fetch(:relative_template_folder)).to eq('.')
  end

  it 'should set relative template folder' do
    config.set(:relative_template_folder, value: 'lib/poc_sample_commands')
    config.write force: true
    expect(config.fetch(:relative_template_folder)).to eq('lib/poc_sample_commands')
  end
end
