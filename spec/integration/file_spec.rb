# frozen_string_literal: true

RSpec.describe '`poc_sample_commands file` command', type: :cli do
  it 'executes `poc_sample_commands help file` command successfully' do
    output = `poc_sample_commands help file`
    expected_output = <<~OUT
      Usage:
        poc_sample_commands file SUBCOMMAND

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Sample uses for the tty-file gem via command
    OUT

    expect(output).to eq(expected_output)
  end
end
