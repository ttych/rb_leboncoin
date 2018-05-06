require 'yaml'

module Leboncoin
  class Configuration
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def account
      _configuration['account']
    end

    def db
      _configuration['db']
    end

    def to_sell_path
      db['to_sell']
    end

    def selling_path
      db['selling']
    end

    def done_path
      db['done']
    end

    private

    def _configuration
      @configuration ||= YAML::load_file(path)
    end
  end
end
