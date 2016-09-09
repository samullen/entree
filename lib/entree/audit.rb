require 'entree'
require 'json'

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
      raw_results = JSON.parse(@output, max_nesting: 200)
      raw_results.map { |result| result.delete('elements') }
      @results = raw_results.group_by { |result| result['status'] }
    rescue Exception => e
      raise Entree::ParserError.new(e.message)
    end
  end
end
