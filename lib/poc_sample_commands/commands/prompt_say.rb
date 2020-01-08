# frozen_string_literal: true

require_relative '../command'

require 'pastel'
require 'tty-config'
require 'tty-prompt'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class PromptSay < PocSampleCommands::Command
      def initialize(options)

        @options = options
      end

      # Execute PromptSay subcommand taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        prompt.say('some cool message')
        prompt.say(Pastel.new.magenta('some cool message pink'))
        
        prompt.ok('OK OK OK')
        prompt.warn('Warning!')
        prompt.error('You really screwed up here')

        return :gui
      end
    end
  end
end
