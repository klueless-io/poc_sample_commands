# frozen_string_literal: true

require_relative '../command'
require_relative '../app'

require 'tty-config'
require 'tty-file'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class Setup < PocSampleCommands::Command
      def initialize(folder, options)
        @folder = folder

        @config = PocSampleCommands::App.config

        if folder
          @config.set(:sample_folder, value: folder)
          @config.write force: true
        end

        @options = options
      end

      def execute(_input: $stdin, output: $stdout)
        unless sample_folder
          output.puts 'invalid sample folder'
          return
        end
        FileUtils.mkdir_p sample_folder

        # TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.txt'#, 'sample.png'
        # puts 'fucit'
        # ::TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.txt'#, 'sample.png'
        # ::TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.txt', 'dave.txt'
        # ::TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.png', 'dave.png'
        # ::TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.png', 'dave.png'
      end

      def sample_folder
        @config.fetch(:sample_folder)
      end

      def relative_template_folder
        @config.fetch(:relative_template_folder)
      end
      
    end
  end
end
