require 'mysticonfig'

Loader = Mysticonfig::Loader unless defined? Loader

fixtures_dir = File.expand_path('./fixtures', File.dirname(__FILE__))

# Default configs
OMG_DEFAULT_CONFIG = {
  'A' => 321,
  'B' => 'GMO',
  'C' => %w[x y z]
}.freeze

WTF_DEFAULT_CONFIG = {
  'X' => 999,
  'Y' => %w[w t f],
  'Z' => true
}.freeze

# Expected configs
EXPECTED_OMG_CONFIG = {
  'A' => 123, # From config file
  'B' => 'OMG', # From config file
  'C' => %w[x y z] # From default
}.freeze

EXPECTED_WTF_CONFIG = {
  'X' => 999,
  'Y' => %w[w t f],
  'Z' => true
}.freeze

RSpec.describe 'Loader with default config' do
  before(:each) do
    Dir.chdir fixtures_dir
  end

  it 'should load config with fallback default config' do
    loader = Loader.new('omg', OMG_DEFAULT_CONFIG)
    config = loader.load
    expect(config).to eql EXPECTED_OMG_CONFIG
  end

  it 'should load default config when no config file' do
    loader = Loader.new('wtf', WTF_DEFAULT_CONFIG)
    config = loader.load
    expect(config).to eql EXPECTED_WTF_CONFIG
  end
end
