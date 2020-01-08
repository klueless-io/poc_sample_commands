# frozen_string_literal: true

RSpec.describe '`poc_sample_commands spinner` command', type: :cli do
  it 'executes `poc_sample_commands help spinner` command successfully' do
    output = `poc_sample_commands help spinner`
    expected_output = <<~OUT
      Usage:
        poc_sample_commands spinner SUBCOMMAND

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Sample uses for the tty-spinner gem - see: https://github.com/piotrmurach/tty-spinner
    OUT

    expect(output).to eq(expected_output)
  end
end
