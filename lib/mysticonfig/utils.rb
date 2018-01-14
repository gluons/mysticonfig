require 'json'
require 'yaml'

# rubocop:disable Style/RescueStandardError

##
# Mystic Config
module Mysticonfig
  ##
  # Utilies
  module Utils
    ##
    # Determine whether the given file is valid JSON file.
    def self.json_file?(file)
      return false if file.nil?

      JSON.parse(File.read(file))
      true
    rescue
      false
    end

    ##
    # Determine whether the given file is valid YAML file.
    def self.yaml_file?(file)
      return false if file.nil?

      result = YAML.safe_load(File.read(file))
      result.is_a?(Hash)
    rescue
      false
    end

    ##
    # Generate config filenames from given app name.
    def self.generate_config_filenames(appname)
      return nil if appname.nil?

      {
        plain: ".#{appname}rc",
        json: ".#{appname}rc.json",
        yaml: [".#{appname}rc.yaml", ".#{appname}rc.yml"]
      }
    end

    ##
    # Load JSON config file.
    def self.load_json(config_file)
      return {} if config_file.nil? || !File.exist?(config_file)

      JSON.parse(File.read(config_file))
    end

    ##
    # Load YAML config file.
    def self.load_yaml(config_file)
      return {} if config_file.nil? || !File.exist?(config_file)

      YAML.safe_load(File.read(config_file))
    end

    ##
    # Load config file with automatic file type detection.
    def self.load_auto(config_file)
      return {} if config_file.nil? || !File.exist?(config_file)

      if json_file?(config_file)
        load_json(config_file)
      elsif yaml_file?(config_file)
        load_yaml(config_file)
      else
        {}
      end
    end
  end
end

# rubocop:enable Style/RescueStandardError
