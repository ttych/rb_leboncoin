module Leboncoin
  # model
  # Ad container
  class Ad
    def self.read_from(file)
      raw_ad = JSON.parse(File.read(file))
      new(raw_ad, file)
    end

    attr_reader :ad, :path

    def initialize(ad, path = nil)
      @ad = ad
      @path = path
    end

    def method_missing(method_name, *args)
      super unless ad.has_key? method_name.to_s
      ad[method_name.to_s]
    end

    def move_to(target_path)
      return unless path
      FileUtils.mv(path, target_path)
    end
  end
end
