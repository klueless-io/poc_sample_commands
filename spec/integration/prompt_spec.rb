# frozen_string_literal: true

RSpec.describe '`poc_sample_commands prompt` command', type: :cli do
  it 'executes `poc_sample_commands help prompt` command successfully' do
    output = `poc_sample_commands help prompt`
    expected_output = <<~OUT
      Usage:
        poc_sample_commands prompt SUBCOMMAND

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Sample uses for the tty-prompt gem - see: https://github.com/piotrmurach/tty-prompt
    OUT

    expect(output).to eq(expected_output)
  end
end
