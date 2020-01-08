# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module PocSampleCommands
  module Commands
    # Command Name goes here
    class Prompt < PocSampleCommands::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand ||= '').to_sym

        @options = options
      end

      # Execute Prompt command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        case @subcommand
        when :gui
          gui
        when :all
          require_relative 'prompt_all'
          subcmd = PocSampleCommands::Commands::PromptAll.new({})
        when :multi_select
          require_relative 'prompt_multi_select'
          subcmd = PocSampleCommands::Commands::PromptMultiSelect.new({})
        when :collect
          require_relative 'prompt_collect'
          subcmd = PocSampleCommands::Commands::PromptCollect.new({})
        when :validation
          require_relative 'prompt_validation'
          subcmd = PocSampleCommands::Commands::PromptValidation.new({})
        when :keypress
          require_relative 'prompt_keypress'
          subcmd = PocSampleCommands::Commands::PromptKeypress.new({})
        when :timeout
          require_relative 'prompt_timeout'
          subcmd = PocSampleCommands::Commands::PromptTimeout.new({})
        when :multi_line
          require_relative 'prompt_multi_line'
          subcmd = PocSampleCommands::Commands::PromptMultiLine.new({})
        when :password
          require_relative 'prompt_password'
          subcmd = PocSampleCommands::Commands::PromptPassword.new({})
        when :bool
          require_relative 'prompt_bool'
          subcmd = PocSampleCommands::Commands::PromptBool.new({})
        when :menu
          require_relative 'prompt_menu'
          subcmd = PocSampleCommands::Commands::PromptMenu.new({})
        when :expand
          require_relative 'prompt_expand'
          subcmd = PocSampleCommands::Commands::PromptExpand.new({})
        when :say
          require_relative 'prompt_say'
          subcmd = PocSampleCommands::Commands::PromptSay.new({})
        when :suggest
          require_relative 'prompt_suggest'
          subcmd = PocSampleCommands::Commands::PromptSuggest.new({})
        when :slider
          require_relative 'prompt_slider'
          subcmd = PocSampleCommands::Commands::PromptSlider.new({})
        end
        
        subcmd.execute(input: input, output: output) if subcmd
      end

      private

      def gui
        prompt = TTY::Prompt.new

        choices = [
          :all,
          :multi_select,
          :collect,
          :validation,
          :keypress,
          :timeout,
          :multi_line,
          :password,
          :bool,
          :menu,
          :expand,
          :say,
          :suggest,
          :slider,
          { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, cycle: true, default: 12)

        command = PocSampleCommands::Commands::Prompt.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
