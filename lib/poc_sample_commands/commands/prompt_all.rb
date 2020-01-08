# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class PromptAll < PocSampleCommands::Command
      def initialize(options)

        @options = options
      end

      # Execute PromptAll subcommand taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new
        
        name = prompt.ask('What is your name?', value: ENV['USER']) do |q|
          q.validate /\A\w+\Z/
          q.modify   :upcase
        end
        puts name
        prompt.ask('What is your home directory?', default: ENV['HOME'])

        prompt.yes?('Do you like Questions?')
        prompt.mask("What is your password?") do |q|
          q.required true
        end

        city = prompt.select("Choose your city?", %w[Sydney Melbourne Brisbane])
        prompt.enum_select("Select an editor?", %w[vscode emacs nano vim])
        prompt.multi_select("Choose your language(s)?", %w[Ruby Python GO])
        prompt.ask('Do you like other languages? (comma sep list)') do |q|
          q.convert -> (input) { input.split(/,\s*/) }
        end

        choices = [
          { key: 'y', name: 'overwrite this file', value: :yes },
          { key: 'n', name: 'do not overwrite this file', value: :no },
          { key: 'a', name: 'overwrite this file and all later files', value: :all },
          { key: 'd', name: 'show diff', value: :diff },
          { key: 'q', name: 'quit; do not overwrite this file ', value: :quit }
        ]
        prompt.expand('Overwrite Gemfile?', choices)

        prompt.keypress("Press any key to fill in a complex form. Starts in :countdown ...", timeout: 5)

        result = prompt.collect do
          key(:name).ask('Name?', value: name)

          key(:age).ask('Age?', convert: :int)

          key(:email).ask('What is your email?', value: ENV['USER_EMAIL']) do |q|
            q.validate(/\A\w+@\w+\.\w+\Z/, 'Invalid email address')
          end

          key(:skill_level).ask('How skilled at microservices are you on a scale (1-5)? ', default: 1) do |q|
            q.in '1-5'
            q.messages[:range?] = '%{value} out of expected range #{in}'
          end

          key(:address) do
            key(:street).ask('Street?') #, required: true)
            key(:city).ask('City?', default: city)
            key(:postcode).ask('Post Code?', validate: /\A\d{4}\Z/, default: city == 'Sydney' ? '2000' : city == 'Melbourne' ? '3000' : city == 'Brisbane' ? '4000' : nil)
          end

          desc = key(:description).multiline(
            'Enter description without redundant whitespace:',
            default: "The quick brown fox\njumped over the lazy dog",
            ) do |q|
            q.modify :strip, :collapse
            q.help 'Press thy ctrl+d to end'
          end

          puts '-' * 70
          puts desc
          puts '-' * 70

          prompt.keypress("Press space or enter to finish", keys: [:space, :return])
        end
        return :gui
      end

    end
  end
end
