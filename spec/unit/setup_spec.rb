# frozen_string_literal: true

require 'poc_sample_commands/commands/setup'

RSpec.describe PocSampleCommands::Commands::Setup do
  it 'executes `setup` command successfully' do
    output = StringIO.new
    folder = Dir.tmpdir
    options = {}
    command = PocSampleCommands::Commands::Setup.new(folder, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
