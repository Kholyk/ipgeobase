# frozen_string_literal: true

require "test_helper"
require "ipgeobase"

class IpgeobaseTest < Minitest::Test 
  def setup
    @geobase_object = Ipgeobase.lookup('188.243.183.134')
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_include
    assert @geobase_object.city == 'St Petersburg'
  end
end
