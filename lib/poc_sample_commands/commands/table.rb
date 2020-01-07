# frozen_string_literal: true

require_relative '../command'

require 'tty-config'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class Table < PocSampleCommands::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand ||= '').to_sym

        @options = options
      end

      def execute(_input: $stdin, output: $stdout)
        output.puts 'OK'

        case @subcommand
        when :basic
          basic
        when :align
          align
        when :multiline
          multiline
        when :ascii
          ascii
        when :unicode
          unicode
        when :ascii
          ascii
        when :row_seperator
          row_seperator
        when :style
          style
        when :padding
          padding
        when :width
          width
        end
      end

      def basic
        
      end
      
      def align
        
      end
      
      def multiline
        
      end
      
      def ascii
        
      end
      
      def unicode
        
      end
      
      def ascii
        
      end
      
      def row_seperator
        
      end
      
      def style
        
      end
      
      def padding
        
      end
      
      def width
        
      end
    end
  end
end
