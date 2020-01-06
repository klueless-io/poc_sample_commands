# frozen_string_literal: true

require 'thor'

module PocSampleCommands
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'poc_sample_commands version'
    def version
      require_relative 'version'
      puts 'v' + PocSampleCommands::VERSION
    end
    map %w[--version -v] => :version

    #
    # file
    #
    desc 'file SUBCOMMAND', 'Sample uses for the tty-file gem via command'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def file(subcommand)
      if options[:help]
        invoke :help, ['file']
      else
        require_relative 'commands/file'
        PocSampleCommands::Commands::File.new(subcommand, options).execute
      end
    end
  end
end
