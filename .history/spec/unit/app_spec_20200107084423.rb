# frozen_string_literal: true

require 'poc_sample_commands/app'

RSpec.describe PocSampleCommands::App do
  let(:app) { PocSampleCommands::App.new }

  it 'executes `setup` command successfully' do
    expect(app.config).to_not be_nil
  end

  it 'should have a sample folder for storing assets' do
    puts app.sample_folder
  end
end
