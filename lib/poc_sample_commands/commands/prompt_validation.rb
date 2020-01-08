# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class PromptValidation < PocSampleCommands::Command
      def initialize(options)

        @options = options
      end

      # Execute PromptValidation subcommand taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        return :gui
      end
    end
  end
end
