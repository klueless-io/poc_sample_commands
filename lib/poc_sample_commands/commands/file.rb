# frozen_string_literal: true

require_relative '../command'

require 'tty-config'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class File < PocSampleCommands::Command
      def initialize(subcommand, options)
        @subcommand = subcommand

        @options = options
      end

      def execute(_input: $stdin, output: $stdout)
        output.puts 'OK'
      end
    end
  end
end
