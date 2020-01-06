# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("poc_sample_commands") do |ext|
  ext.lib_dir = "lib/poc_sample_commands"
end

task :default => [:clobber, :compile, :spec]
