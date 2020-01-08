# frozen_string_literal: true

RSpec.describe '`poc_sample_commands progress_bar` command', type: :cli do
  it 'executes `poc_sample_commands help progress_bar` command successfully' do
    output = `poc_sample_commands help progress_bar`
    expected_output = <<~OUT
      Usage:
        poc_sample_commands progress_bar SUBCOMMAND

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Sample uses for the tty-progressbar gem - see: https://github.com/piotrmurach/tty-progressbar
    OUT

    expect(output).to eq(expected_output)
  end
end
