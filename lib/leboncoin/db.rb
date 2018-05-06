require 'json'

module Leboncoin
  class Db
    def initialize(path)
      @path = path
    end

    def sells
      Dir[_sell_path + "/*.json"].map do |json_file|
        JSON.parse(File.read(json_file))
      end
    end

    private

    attr_reader :path

    def _sell_path
      path + '/ventes'
    end

    def _done_path
      path + '/vendu'
    end
  end
end
