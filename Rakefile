# require "bundler/gem_tasks"
# require 'rspec/core/rake_task'

# # RSpec::Core::RakeTask.new do |t|
# #   t.pattern = "spec/**/*_spec.rb"
# # end

# desc "Default: run all specs"
# task :default => [:spec]

# task :build => ["axs:make"]

# desc "Google Accessibility Developer Tools"
# namespace :axs do
#   desc "Generate Accessibility Developer Tools axs_testing.js"
#   task :make do
#     system "cd vendor/accessibility-developer-tools/ && make"
#   end
# end
require 'rake/testtask'

lib_dir = File.expand_path('lib')
test_dir = File.expand_path('test')

Rake::TestTask.new(:test) do |t|
  t.libs = [lib_dir, test_dir]
  t.pattern = 'test/**/*rb'
end

desc "Run tests"
task :default => :test
