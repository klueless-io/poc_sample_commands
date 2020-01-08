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
    # setup
    #
    desc 'setup FOLDER', 'Setup a playground area in which to read and write files for sample commands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def setup(folder)
      if options[:help]
        invoke :help, ['setup']
      else
        require_relative 'commands/setup'
        PocSampleCommands::Commands::Setup.new(folder, options).execute
      end
    end
    
    #
    # file
    #
    desc 'file SUBCOMMAND', 'Sample uses for the tty-file gem - see: https://github.com/piotrmurach/tty-table'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def file(subcommand = :gui)
      if options[:help]
        invoke :help, ['file']
      else
        require_relative 'commands/file'
        PocSampleCommands::Commands::File.new(subcommand, options).execute
      end
    end
    
    #
    # log
    #
    desc 'log SUBCOMMAND', 'Sample uses for the tty-logger gem - see: https://github.com/piotrmurach/tty-logger'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def log(subcommand = :gui)
      if options[:help]
        invoke :help, ['log']
      else
        require_relative 'commands/log'
        PocSampleCommands::Commands::Log.new(subcommand, options).execute
      end
    end
    
    #
    # spinner
    #
    desc 'spinner SUBCOMMAND', 'Sample uses for the tty-spinner gem - see: https://github.com/piotrmurach/tty-spinner'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def spinner(subcommand = :gui)
      if options[:help]
        invoke :help, ['spinner']
      else
        require_relative 'commands/spinner'
        PocSampleCommands::Commands::Spinner.new(subcommand, options).execute
      end
    end
    
    #
    # markdown
    #
    desc 'markdown SUBCOMMAND', 'Sample uses for the tty-markdown gem - see: https://github.com/piotrmurach/tty-table'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def markdown(subcommand = :gui)
      if options[:help]
        invoke :help, ['markdown']
      else
        require_relative 'commands/markdown'
        PocSampleCommands::Commands::Markdown.new(subcommand, options).execute
      end
    end
    
    #
    # table
    #
    desc 'table SUBCOMMAND', 'Sample uses for the tty-table gem - see: https://github.com/piotrmurach/tty-table'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def table(subcommand = :gui)
      if options[:help]
        invoke :help, ['table']
      else
        require_relative 'commands/table'
        PocSampleCommands::Commands::Table.new(subcommand, options).execute
      end
    end
    
    #
    # font
    #
    desc 'font SUBCOMMAND', 'Sample uses for the tty-font gem - see: https://github.com/piotrmurach/tty-font'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def font(subcommand = :gui)
      if options[:help]
        invoke :help, ['font']
      else
        require_relative 'commands/font'
        PocSampleCommands::Commands::Font.new(subcommand, options).execute
      end
    end
    
    #
    # progress_bar
    #
    desc 'progress_bar SUBCOMMAND', 'Sample uses for the tty-progressbar gem - see: https://github.com/piotrmurach/tty-progressbar'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def progress_bar(subcommand = :gui)
      if options[:help]
        invoke :help, ['progress_bar']
      else
        require_relative 'commands/progress_bar'
        PocSampleCommands::Commands::ProgressBar.new(subcommand, options).execute
      end
    end
    
    #
    # prompt
    #
    desc 'prompt SUBCOMMAND', 'Sample uses for the tty-prompt gem - see: https://github.com/piotrmurach/tty-prompt'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def prompt(subcommand = :gui)
      if options[:help]
        invoke :help, ['prompt']
      else
        require_relative 'commands/prompt'
        PocSampleCommands::Commands::Prompt.new(subcommand, options).execute
      end
    end
  end
end
