# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-markdown'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class Markdown < PocSampleCommands::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand ||= '').to_sym

        @options = options
      end

      def execute(_input: $stdin, output: $stdout)
        output.puts 'OK'

        case @subcommand
        when :simple
          simple
        when :list
          list
        when :code
          code
        when :table
          table
        end
      end

      def simple
        markdown = <<~MARKDOWN
        Just some words
        
        # Heading 1

        ## Heading 2
        
        ### Heading 3
        
        #### Heading 4
        
        ##### Heading 5

        ***
        
        Just some words

        #### Link could go here

        [I'm an inline-style link](https://www.google.com)

        ## Or a block quote

        > Blockquotes are very handy in email to emulate reply text.
        > This line is part of the same quote.
        > *Oh*, you can put **Markdown** into a blockquote.

        MARKDOWN
        parsed = TTY::Markdown.parse(markdown)
        puts parsed
      end
      
      def list
        markdown = <<~MARKDOWN
          - Item 1
            - Item 2
            - Item 3
              - Item 4
          - Item 5
        MARKDOWN
        parsed = TTY::Markdown.parse(markdown)
        puts parsed

      end
      
      def code

        name = 'Bobby'

        markdown = <<~MARKDOWN
          ```ruby
          class Greeter
            def hello(name)
              puts "Hello #{name}"
            end
          end
          ```
        MARKDOWN
        parsed = TTY::Markdown.parse(markdown)
        puts parsed
      end
      
      def table
        
        markdown = <<~MARKDOWN
          | Tables   |      Are      |  Cool |
          |----------|:-------------:|------:|
          | col 1 is |  left-aligned | $1600 |
          | col 2 is |    centered   |   $12 |
          | col 3 is | right-aligned |    $1 |
        MARKDOWN
        parsed = TTY::Markdown.parse(markdown)
        puts parsed
      end
    end
  end
end
