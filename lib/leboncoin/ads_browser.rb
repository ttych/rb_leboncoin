module Leboncoin
  # service
  # browse ads in directory
  class AdsBrowser
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def each
      Dir[path + "/*.json"].each do |ad_file|
        ad = Ad.read_from(ad_file)
        yield ad
      end
    end
  end
end
