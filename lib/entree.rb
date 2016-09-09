require "entree/version"

module Entree
  autoload :Audit, 'entree/runner'
  autoload :Runner, 'entree/audit'

  class Error < StandardError; end
  class AuditError < Error; end
  class ParserError < Error; end
  class RunnerError < Error; end
end
