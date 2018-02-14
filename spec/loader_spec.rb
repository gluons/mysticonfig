require 'mysticonfig'

Loader = Mysticonfig::Loader unless defined? Loader

fixtures_dir = File.expand_path('./fixtures', File.dirname(__FILE__))

EXPECTED_PLAIN_CONFIG = {
  'x' => 0,
  'y' => true,
  'z' => 'LOL'
}.freeze

EXPECTED_NON_PLAIN_CONFIG = {
  'x' => 99,
  'y' => false,
  'z' => 'ROFL'
}.freeze

RSpec.describe 'Loader' do
  before(:each) do
    Dir.chdir fixtures_dir
  end

  it 'should automatically detect and load config file' do
    loader = Loader.new 'lmao'
    config = loader.load
    expect(config).to eql EXPECTED_PLAIN_CONFIG
  end

  it 'should load JSON config file correctly' do
    loader = Loader.new 'lmao'
    config = loader.load_json
    expect(config).to eql EXPECTED_NON_PLAIN_CONFIG
  end

  it 'should load YAML config file correctly' do
    loader = Loader.new 'lmao'
    config = loader.load_yaml
    expect(config).to eql EXPECTED_NON_PLAIN_CONFIG
  end
end
