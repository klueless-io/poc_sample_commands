# frozen_string_literal: true

require 'thor'

module PocSampleCommands
  # Handle the global access such as configuration
  class App
    attr_reader :config

    def initialize
      @config = TTY::Config.new
      @config.filename = 'poc_sample_commands'
      @config.extname = '.yml'
      @config.append_path Dir.pwd # Dir.home
      
    end

    def self.config
      @config ||= new.config
    end
  end
end
