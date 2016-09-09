module Entree
  class Runner
    RUNNER_PATH = File.expand_path("../../../vendor/HTML_CodeSniffer/Contrib/PhantomJS/HTMLCS_Run.js", __FILE__)
    attr_reader :output

    def initialize(target)
      @target = target
    end

    def run
      @output = `phantomjs #{RUNNER_PATH} #{@target} WCAG2AA json`
      return if audit_success?

      if !phantomjs_installed?
        fail Entree::RunnerError.new("Please install PhantomJS. Visit http://phantomjs.org/ for instructions.")
      else
        fail Entree::RunnerError.new("PhantomJS exited without success: #{@output}")
      end
    end

    private

    def audit_success?
      $?.success?
    end

    def phantomjs_installed?
      $?.exitstatus != 127
    end
  end
end
