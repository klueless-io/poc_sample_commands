# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-font'
require 'pastel'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class Font < PocSampleCommands::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand ||= '').to_sym

        @options = options
      end

      def execute(_input: $stdin, output: $stdout)
        output.puts 'OK'

        case @subcommand
        when :d3
          d3
        when :block
          block
        when :doom
          doom
        when :standard
          standard
        when :starwars
          starwars
        when :straight
          straight
        end
      end

      def d3
        puts Pastel.new.yellow(TTY::Font.new('3d').write('In3D'))
      end
      
      def block
        puts Pastel.new.red(TTY::Font.new(:block).write('Block-Head'))
      end
      
      def doom
        font = TTY::Font.new(:doom)
        puts font.write('DOOM!')
        puts font.write("DOOM", letter_spacing: 4)
      end
      
      def standard
        puts Pastel.new.green(TTY::Font.new(:standard).write('Standard'))
      end
      
      def starwars
        puts Pastel.new.red(TTY::Font.new(:starwars).write('Starwars'))
      end
      
      def straight
        puts Pastel.new.red(TTY::Font.new(:straight).write('straight'))
      end
    end
  end
end
