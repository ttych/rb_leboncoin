module Leboncoin
  # service
  # post sell ads
  class AdsSeller
    attr_reader :configuration

    def initialize(configuration, session = nil)
      @configuration = configuration
      @session = session
    end

    def proceed
      AdsBrowser.new(configuration.to_sell_path)
                .each do |sell|
        _post_sell(sell)
        _update_sell_status(sell)
      end
    end

    private

    def _post_sell(sell)
      AdPoster.new(sell, _session)
              .post
    end

    def _update_sell_status(sell)
      sell.move_to(configuration.selling_path)
    end

    def _session
      @session ||= Session.new(*configuration.account.values)
    end
  end
end
