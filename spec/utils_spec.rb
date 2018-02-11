require 'mysticonfig/utils'

Utils = Mysticonfig::Utils

fixtures_dir = File.expand_path('./fixtures', File.dirname(__FILE__))
plain_fixture = File.expand_path('.lolrc', fixtures_dir)
json_fixture = File.expand_path('.lolrc.json', fixtures_dir)
yaml_fixture = File.expand_path('.lolrc.yaml', fixtures_dir)

EXPECTED_CONFIG = {
  'a' => 1,
  'b' => false,
  'c' => 'LMAO'
}.freeze

# rubocop:disable Metrics/BlockLength

RSpec.describe 'Utilities methods' do
  it 'should be able to detect JSON file' do
    expect(Utils.yaml_file?(json_fixture)).to be false
    expect(Utils.json_file?(json_fixture)).to be true
  end

  it 'should be able to detect YAML file' do
    expect(Utils.json_file?(yaml_fixture)).to be false
    expect(Utils.yaml_file?(yaml_fixture)).to be true
  end

  it 'should generate correct config files name' do
    filenames = Utils.generate_config_filenames('lol')
    expected_filenames = {
      plain: '.lolrc',
      json: '.lolrc.json',
      yaml: ['.lolrc.yaml', '.lolrc.yml']
    }
    expect(filenames).to eql expected_filenames
  end

  it 'should load JSON file correctly' do
    config = Utils.load_json json_fixture
    expect(config).to eql EXPECTED_CONFIG
  end

  it 'should load YAML file correctly' do
    config = Utils.load_yaml yaml_fixture
    expect(config).to eql EXPECTED_CONFIG
  end

  it 'should automatically detect and load config file correctly' do
    config = Utils.load_auto plain_fixture
    expect(config).to eql EXPECTED_CONFIG
  end
end

# rubocop:enable Metrics/BlockLength
