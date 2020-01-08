# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class PromptSlider < PocSampleCommands::Command
      def initialize(options)

        @options = options
      end

      # Execute PromptSlider subcommand taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        prompt.slider('Volume', max: 100, step: 5)

        prompt.slider('Volume', max: 100, step: 5, default: 75)

        prompt.slider('Volume', max: 100, step: 5, default: 75, format: "|:slider| [%4d]")

        prompt.slider("Volume", max: 10, step: 0.5, default: 5, format: "|:slider| %.1f")

        prompt.slider("Volume", max: 100, step: 5, default: 75, symbols: {bullet: 'x', line: '_'})

        # NOT WORKING
        # prompt.slider('What size?') do |range|
        #   range.max 100
        #   range.step 5
        #   range.default 75
        #   range.format "|:slider| %d%"
        # end

        return :gui
      end
    end
  end
end
