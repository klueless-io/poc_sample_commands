# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-logger'

module PocSampleCommands
  module Commands
    # Command Log - some sample logger examples
    # see more: https://github.com/piotrmurach/tty-logger
    class Log < PocSampleCommands::Command
      attr_reader :logger
      def initialize(subcommand, options)
        @logger = TTY::Logger.new
        @subcommand = (subcommand ||= '').to_sym

        @options = options
      end

      def execute(_input: $stdin, output: $stdout)
        output.puts 'OK'

        case @subcommand
        when :simple_log
          simple_log
        when :meta_data
          meta_data
        when :levels
          levels
        when :exceptions
          exceptions
        when :types
          types
        end

      end

      private

      def simple_log
        logger.info "Deployed successfully"
        logger.info "Deployed", "successfully"
        logger.info { "Dynamically generated info" }

        logger.success "Include structured data", myapp: "myapp", env: "prod"
      end

      def meta_data
        logger = TTY::Logger.new do |config|
          config.metadata = [:date, :time]
        end
        logger.success "Include structured data", myapp: "myapp", env: "prod"

        logger = TTY::Logger.new do |config|
          config.formatter = :json
        end
        logger.info "Deployed successfully"
        logger.success "Include structured data", myapp: "myapp", env: "prod"
      end

      def levels
        logger.debug    'logs message at :debug level'
        logger.info     'logs message at :info level'
        logger.success  'logs message at :info level'
        logger.wait     'logs message at :info level'
        logger.warn     'logs message at :warn level'
        logger.error    'logs message at :error level'
        logger.fatal    'logs message at :fatal level'
      end

      def exceptions
        begin
          raise ArgumentError, "Wrong data"
        rescue => ex
          logger.fatal("Error:", ex)
        end
      end

      def types
        logger = TTY::Logger.new do |config|
          config.types = {
            thanks: {level: :info},
            done: {level: :info}
          }
          config.handlers = [
            [:console, {
              styles: {
                thanks: {
                  symbol: "❤️ ",
                  label: "thanks",
                  color: :magenta,
                  levelpad: 0
                },
                done: {
                  symbol: "!!",
                  label: "done",
                  color: :green,
                  levelpad: 2
                }
              }
            }]
          ]
        end

        logger.thanks("Great work!")
        logger.done("Work done!")
      end
    end
  end
end
