# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class PromptSuggest < PocSampleCommands::Command
      def initialize(options)

        @options = options
      end

      # Execute PromptSuggest subcommand taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        prompt.suggest('sta', ['stage', 'stash', 'commit', 'branch'])

        possible = %w(status stage stash commit branch blame)
        prompt.suggest('b', possible, indent: 4, single_text: 'Perhaps you meant?')

        return :gui
      end
    end
  end
end
