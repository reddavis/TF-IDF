$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'tf_idf'
require 'rspec'
require 'rspec/autorun'

RSpec.configure do |config|
  
end

module SampleData
  def self.regular_data
    [%w{a a a a a a a a b b}, %w{a a}]
  end

  def self.sparse_data
    [{'a' => 8, 'b' => 2}, {'a' => 2}]
  end
end
