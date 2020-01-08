# frozen_string_literal: true

RSpec.describe '`poc_sample_commands log` command', type: :cli do
  it 'executes `poc_sample_commands help log` command successfully' do
    output = `poc_sample_commands help log`
    expected_output = <<~OUT
      Usage:
        poc_sample_commands log SUBCOMMAND

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Sample uses for the tty-logger gem - see: https://github.com/piotrmurach/tty-logger
    OUT

    expect(output).to eq(expected_output)
  end
end
