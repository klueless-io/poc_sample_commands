# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-table'

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
        when :padding
          padding
        when :width
          width
        end
      end

      def basic
        table = TTY::Table.new ['header1','header2'], [['a1', 'a2'], ['b1', 'b2']]

        puts "table.rows_size: #{table.rows_size}"
        puts "table.columns_size: #{table.columns_size}"
        puts "table.size: #{table.size}"

        heading 'basic'
        puts table.render(:basic)

        heading 'basic'
        puts 'ascii'
        puts table.render(:ascii)

        heading 'unicode'
        puts table.render(:unicode)

      end

      def align
        heading 'column alignment'
        table = TTY::Table.new ['header1','header2','header3'], [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['b1', 'c2', 'c3']]

        puts table.render :unicode, alignments: [:left, :center, :right]

        heading 'custom alignment'
        table = TTY::Table.new header: ['header1', 'header2']
        table << [{value: 'a1', alignment: :right}, 'a2']
        table << ['b1', {value: 'b2', alignment: :center}]

        puts table.render :unicode
      end
      
      def multiline
        table = TTY::Table.new [ ["First", '1'], ["Multi\nLine\nContent", '2'], ["Third", '3']]
        puts table.render :ascii, multiline: true
      end
      
      def padding
        table = TTY::Table.new header: ['head1', 'head2']
        table << ["Multi\nLine", "Text\nthat\nwraps"]
        table << ["Some\nother\ntext", 'Simple']
        puts table.render :ascii, multiline: true, padding: [1,2,1,2]
        
      end
      
      def width
        header = ['h1', 'h2', 'h3']
        rows   = [['aaa1', 'aa2', 'aaaaaaa3'], ['b1', 'b2', 'b3']]
        table = TTY::Table.new header, rows
        puts table.render :unicode, width: 80, resize: true 
      end

      def heading(heading)
        line
        puts heading
        line
      end

      def line
        puts '-' * 70
      end

    end
  end
end
