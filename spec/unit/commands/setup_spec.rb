# frozen_string_literal: true

require 'poc_sample_commands/commands/setup'

RSpec.describe PocSampleCommands::Commands::Setup do

  before(:all) {
    @tmp_dir = Dir.tmpdir
  }

  it 'executes `setup` command successfully' do
    output = StringIO.new
    folder = nil
    options = {}
    command = PocSampleCommands::Commands::Setup.new(folder, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end

  it 'should have a sample folder stored in config' do

  end
end
