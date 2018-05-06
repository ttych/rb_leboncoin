require 'test_helper'

class LeboncoinTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Leboncoin::VERSION
  end
end
