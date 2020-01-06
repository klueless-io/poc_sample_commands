# frozen_string_literal: true

require 'poc_sample_commands/app'

RSpec.describe PocSampleCommands::App do
  

  it 'executes `setup` command successfully' do
    app = PocSampleCommands::App.new(folder, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end

  it 'should have a sample folder for storing assets' do

  end
end
