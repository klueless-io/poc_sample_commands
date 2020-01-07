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
    # log
    #
    desc 'log SUBCOMMAND', 'Sample uses for the tty-logger gem via command'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def log(subcommand)
      if options[:help]
        invoke :help, ['log']
      else
        require_relative 'commands/log'
        PocSampleCommands::Commands::Log.new(subcommand, options).execute
      end
    end
  end
end
