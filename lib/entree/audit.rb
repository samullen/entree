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
      # refactor into new class
      raw_results = Oj.load(@output).map {|record|
        if record["code"][0..3] == "WCAG"
          record["code"].match /(WCAG2A+\.\w+?\.Guideline(\d_\d)\.\2_\d)\.((?:[A-Z]+\d+,?)+)/
          record["code"] = $1
          record["infractions"] = $3.to_s.split /,/
        end

        record
      }

      @results = raw_results.group_by { |result| result['type'] }
    rescue Exception => e
      raise Entree::ParserError.new(e.message)
    end
  end
end
