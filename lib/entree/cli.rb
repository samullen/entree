require 'thor'
require 'command_line_reporter'
require 'awesome_print'

module Entree
  class CLI < Thor
    include CommandLineReporter

    desc 'audit', 'audit TARGET'
    def audit(target)
      report(message: "auditing #{target}", color: "blue") do
        ap Audit.new(target).run, index: false
      end
    end
  end
end
