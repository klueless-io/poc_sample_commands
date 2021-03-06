# frozen_string_literal: true

RSpec.describe '`poc_sample_commands markdown` command', type: :cli do
  it 'executes `poc_sample_commands help markdown` command successfully' do
    output = `poc_sample_commands help markdown`
    expected_output = <<~OUT
      Usage:
        poc_sample_commands markdown SUBCOMMAND

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Sample uses for the tty-markdown gem - see: https://github.com/piotrmurach/tty-table
    OUT

    expect(output).to eq(expected_output)
  end
end
