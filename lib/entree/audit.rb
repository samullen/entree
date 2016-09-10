require 'entree'
require 'oj'

module Entree
  class Audit
    attr_reader :target

    def initialize(target)
      @target = target
    end

    def run
      perform_audit
    end

    def runner
      @runner ||= Runner.new(self.target)
    end

    private

    def perform_audit
      runner.run
      @output = runner.output
      parse_output
    end

    def parse_output
      raw_results = Oj.load(@output, max_nesting: 200)
      @results = raw_results.group_by { |result| result['type'] }
    rescue Exception => e
      raise Entree::ParserError.new(e.message)
    end
  end
end
