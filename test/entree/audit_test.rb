require 'minitest/autorun'
require 'entree'

describe Entree::Audit do
  describe "Initialization" do
    it "requires a target to audit" do
      Entree::Audit.new("http://example.com").must_be_instance_of Entree::Audit
    end
  end

  describe '#run' do
    it 'return a parsed set of results' do
      # target = double
      # output = JSON.generate([{status: 'passing', foo: 'bar'}])

      # audit = Entree::Audit.new(target)
      # audit.stub(:runner) { double(:runner, output: output, run: double) }

      # expect(audit.run).to eq "passing"=>[{"status"=>"passing", "foo"=>"bar"}]
    end
  end

  describe "#runner" do
    it "returns an Entree::Runner object" do
      audit = Entree::Audit.new("http://example.com")
      audit.runner.must_be_instance_of Entree::Runner
    end
  end
end
