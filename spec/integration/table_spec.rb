# frozen_string_literal: true

RSpec.describe '`poc_sample_commands table` command', type: :cli do
  it 'executes `poc_sample_commands help table` command successfully' do
    output = `poc_sample_commands help table`
    expected_output = <<~OUT
      Usage:
        poc_sample_commands table SUBCOMMAND

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Sample uses for the tty-table gem via command - see: https://github.com/piotrmurach/tty-table
    OUT

    expect(output).to eq(expected_output)
  end
end
