require "bundler/gem_tasks"

require 'rake/testtask'
Rake::TestTask.new do |test|
  test.libs << 'lib' << 'spec'
  test.ruby_opts << "-rubygems"
  test.pattern = 'spec/**/*_spec.rb'
  test.verbose = true
end

task default: :test
