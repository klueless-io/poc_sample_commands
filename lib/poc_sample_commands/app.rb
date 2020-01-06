# frozen_string_literal: true

require 'thor'

require 'tty-config'

module PocSampleCommands
  # Handle the global access such as configuration
  class App
    attr_reader :config

    def initialize
      @config = TTY::Config.new
      @config.filename = 'poc_sample_commands'
      @config.extname = '.yml'
      @config.append_path Dir.pwd # Dir.home
      @config.set(:relative_template_folder, value: '.')
    end

    def self.config
      @config ||= new.config
    end

    def self.sample_folder
      config.fetch(:sample_folder)
    end

    def self.relative_template_folder
      config.fetch(:relative_template_folder)
    end

  end
end
