# frozen_string_literal: true

require 'poc_sample_commands/app'

RSpec.describe PocSampleCommands::App do
  

  it 'executes `setup` command successfully' do
    app = PocSampleCommands::App.new

    expect(app.config).to_not be_nil
  end

  it 'should have a sample folder for storing assets' do

  end
end
