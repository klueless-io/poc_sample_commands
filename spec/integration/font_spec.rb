# frozen_string_literal: true

RSpec.describe '`poc_sample_commands font` command', type: :cli do
  it 'executes `poc_sample_commands help font` command successfully' do
    output = `poc_sample_commands help font`
    expected_output = <<~OUT
      Usage:
        poc_sample_commands font SUBCOMMAND

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Sample uses for the tty-font gem - see: https://github.com/piotrmurach/tty-font
    OUT

    expect(output).to eq(expected_output)
  end
end
