# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class ProgressBar < PocSampleCommands::Command
      def initialize(subcommand = :gui, options)
        @subcommand = (subcommand ||= '').to_sym

        @options = options
      end

      # Execute ProgressBar command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        case @subcommand
        when :gui
          gui
        when :basic
          require_relative 'progress_bar_basic'
          subcmd = PocSampleCommands::Commands::ProgressBarBasic.new({})
        end
        
        subcmd.execute(input: input, output: output) if subcmd
      end

      private

      def gui
        prompt = TTY::Prompt.new

        choices = [
          'basic',
          { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, cycle: true)

        command = PocSampleCommands::Commands::ProgressBar.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
