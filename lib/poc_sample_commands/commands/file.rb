# frozen_string_literal: true

require_relative '../command'
require_relative '../app'

require 'tty-config'
require 'tty-file'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class File < PocSampleCommands::Command
      attr_reader :app
      attr_reader :is_binary

      def initialize(subcommand, options)
        @app ||= PocSampleCommands::App
        @subcommand = (subcommand ||= '').to_sym

        @options = options
      end

      def execute(_input: $stdin, output: $stdout)
        @output = output
        @is_binary = false

        # puts "Subcommand: #{@subcommand}" 

        case @subcommand
        when :copy_file
          copy_file('templates/file/sample.txt', 'sample.txt')
        when :remove_file
          remove_file('sample.txt')
        when :binary
          binary?('templates/file/sample.png')
        end

        # @output.puts 'OK'

        #         puts '-' * 70
        # puts 'sample folder:'
        # puts '-' * 70
        # puts sample_folder
        
        # puts '-' * 70
        # puts 'relative template folder:'
        # puts '-' * 70
        # puts relative_template_folder
        # puts '-' * 70
        # puts 'template file:'
        # puts '-' * 70
        # puts get_template_file('templates/setup/sample.txt')
        # puts '-' * 70


      end

      def remove_file(target_file)
        target_file_path = ::File.join(app.sample_folder, target_file)

        TTY::File.remove_file target_file_path

        # @output.puts "TTY::File.remove_file '#{target_file}'"
      end

      def copy_file(template_file, target_file)
        template_file_path = app.get_template_file(template_file)
        # puts template_file_path
        # puts app.sample_folder
        # puts target_file
        target_file_path = ::File.join(app.sample_folder, target_file)

        TTY::File.copy_file template_file_path, target_file_path

        # @output.puts "TTY::File.copy_file '#{template_file_path}', '#{target_file_path}'"
      end

      def binary?(template_file)
        template_file_path = app.get_template_file(template_file)

        @is_binary = TTY::File.binary? template_file_path

        # @output.puts "TTY::File.copy_file '#{template_file_path}', '#{target_file_path}'"
      end

    end
  end
end
