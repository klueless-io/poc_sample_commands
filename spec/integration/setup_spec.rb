# frozen_string_literal: true

RSpec.describe '`poc_sample_commands setup` command', type: :cli do
  it 'executes `poc_sample_commands help setup` command successfully' do
    output = `poc_sample_commands help setup`
    expected_output = <<~OUT
      Usage:
        poc_sample_commands setup FOLDER

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Setup a playground area in which to read and write files for sample commands
    OUT

    expect(output).to eq(expected_output)
  end
end
