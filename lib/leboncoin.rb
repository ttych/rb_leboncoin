require 'json'
require 'fileutils'

require 'capybara'

require 'leboncoin/version'
require 'leboncoin/configuration'
require 'leboncoin/session'
require 'leboncoin/ad'
require 'leboncoin/ads_browser'
require 'leboncoin/ads_seller'
require 'leboncoin/ad_poster'


# module definition / reservation
module Leboncoin
  URL = 'https://www.leboncoin.fr/'.freeze
end
