require 'test_helper'

class AdPosterTest < Minitest::Test
  def test_ad_poster_instance_creation
    ad = nil

    ad_poster = Leboncoin::AdPoster.new(ad)
    assert ad_poster
  end
end
