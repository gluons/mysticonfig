require_relative 'mysticonfig/utils'

Utils = Mysticonfig::Utils

##
# Mystic Config
module Mysticonfig
  ##
  # Configuration loader.
  class Loader
    def initialize(appname)
      @filenames = Utils.generate_config_filenames appname
    end

    ##
    # Find and load config file.
    def load
      config_file = find_file @filenames

      Utils.load_auto config_file
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
