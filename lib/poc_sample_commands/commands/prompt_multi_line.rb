# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class PromptMultiLine < PocSampleCommands::Command
      def initialize(options)

        @options = options
      end

      # Execute PromptMultiLine subcommand taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        description = prompt.multiline("Description?")

        heading 'Muliline description'
        puts description

        description = prompt.multiline("Description - see prompt -->?", default: 'A super sweet prompt.')


        return :gui
      end
    end
  end
end
