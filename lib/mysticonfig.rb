require_relative 'mysticonfig/utils'

##
# Mystic Config
module Mysticonfig
  ##
  # Configuration loader.
  class Loader
    def initialize(appname, default_config = {})
      @filenames = Utils.generate_config_filenames appname
      @default_config = default_config
    end

    ##
    # Find and load config file.
    def load
      config_file = find_file @filenames

      config = Utils.load_auto config_file
      config.empty? ? @default_config : @default_config.merge(config)
    end

    ##
    # Find and load JSON config file.
    def load_json
      json_config_file = Utils.lookup_file @filenames[:json]

      config = Utils.load_json json_config_file
      config.empty? ? @default_config : @default_config.merge(config)
    end

    ##
    # Find and load YAML config file.
    def load_yaml
      yaml_config_files = @filenames[:yaml]
      yaml_config_file = nil

      yaml_config_files.each do |file|
        yaml_config_file = Utils.lookup_file file
        unless yaml_config_file.nil?
          config = Utils.load_yaml(yaml_config_file)
          return config.empty? ? @default_config : @default_config.merge(config)
        end
      end

      @default_config # Return default config when can't load config file
    end

    private

    # rubocop:disable Metrics/MethodLength

    ##
    # Find an existent config file from all posible files.
    def find_file(filenames)
      return nil if filenames.nil?

      filenames.each_value do |value|
        if value.is_a? Array
          value.each do |file|
            file_path = Utils.lookup_file file
            return file_path unless file_path.nil?
          end
        else
          file_path = Utils.lookup_file value
          return file_path unless file_path.nil?
        end
      end

      nil
    end

    # rubocop:enable Metrics/MethodLength
  end
end
