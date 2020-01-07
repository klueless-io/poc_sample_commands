# frozen_string_literal: true

require 'poc_sample_commands/commands/log'

RSpec.describe PocSampleCommands::Commands::Log do
  it 'executes `log` command successfully' do
    output = StringIO.new
    subcommand = nil
    options = {}
    command = PocSampleCommands::Commands::Log.new(subcommand, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
