require 'json'
require 'yaml'

##
# Mystic Config
module Mysticonfig
  ##
  # Utilities
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
      return false if file.nil? || json_file?(file)

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

    ##
    # Look up for an existent config file.
    def self.lookup_file(config_file, dir = Dir.pwd)
      dir = File.realpath dir

      # Stop on home directory or root directory.
      home_path = File.expand_path '~'
      while (dir != home_path) && (dir != '/')
        current_filepath = File.expand_path(config_file, dir)
        return current_filepath if File.exist?(current_filepath)

        dir = File.realpath('..', dir) # Traverse up
      end

      nil
    end
  end
end
