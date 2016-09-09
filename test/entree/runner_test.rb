require "minitest/autorun"
require "entree"

describe Entree::Runner do
  it 'runs phantomjs' do
    skip
    target = double
    runner = Runner.new(target)

    expect(runner).to receive(:`).with(/^phantomjs.*/)
    runner.run
  end
end
