# frozen_string_literal: true

require 'poc_sample_commands/commands/file'

RSpec.describe PocSampleCommands::Commands::File do
  it 'executes `file` command successfully' do
    output = StringIO.new
    subcommand = nil
    options = {}
    command = PocSampleCommands::Commands::File.new(subcommand, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
