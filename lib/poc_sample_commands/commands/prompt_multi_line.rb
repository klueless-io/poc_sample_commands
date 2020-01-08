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

        heading prompt.multiline("Description (multi line)?")

        heading prompt.multiline("Description - see prompt -->?", default: 'A super sweet prompt.')

        heading prompt.multiline("Description (dsl)?") do |q|
          q.default 'A super sweet prompt.'
          q.help 'Press thy ctrl+d to end'
        end
        
        return :gui
      end
    end
  end
end
