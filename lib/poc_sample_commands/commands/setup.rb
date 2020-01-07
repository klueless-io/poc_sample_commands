# frozen_string_literal: true

require_relative '../command'
require_relative '../app'

require 'tty-config'
require 'tty-file'
require 'forwardable'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class Setup < PocSampleCommands::Command
      attr_reader :app

      def initialize(folder, options)
        @app ||= PocSampleCommands::App
        @folder = folder

        if folder
          @app.config.set(:sample_folder, value: folder)
          @app.config.write force: true
        end

        @options = options
      end

      def execute(_input: $stdin, output: $stdout)
        unless app.sample_folder
          output.puts 'invalid sample folder'
          return
        end
        FileUtils.mkdir_p app.sample_folder

        # create_sample_text()

        # puts '-' * 70
        # puts 'sample folder:'
        # puts '-' * 70
        # puts app.sample_folder
        
        # puts '-' * 70
        # puts 'relative template folder:'
        # puts '-' * 70
        # puts app.relative_template_folder
        # puts '-' * 70
        # puts 'template file:'
        # puts '-' * 70
        # puts app.get_template_file('templates/setup/sample.txt')
        # puts '-' * 70

        # TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.txt'#, 'sample.png'
        # puts 'fucit'
        # ::TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.txt'#, 'sample.png'
        # TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.txt', 'dave.txt'
        # ::TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.png', 'dave.png'
        # ::TTY::File.copy_file 'lib/poc_sample_commands/templates/setup/sample.png', 'dave.png'
      end

      private

      # def create_sample_text
      #   File.write()
      # end
    end
  end
end
