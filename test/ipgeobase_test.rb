# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  def setup
    raw_response_file = File.new("./test/response.txt")
    stub_request(:get, "http://ip-api.com/xml/?query=188.243.183.134")
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "User-Agent" => "Ruby"
        }
      ).to_return(status: 200, body: File.open(raw_response_file), headers: {})
    @geobase_object = Ipgeobase.lookup("188.243.183.134")
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_country_code
    assert @geobase_object.countryCode == "RU"
    assert @geobase_object.city == "St Petersburg"
    assert @geobase_object.country == "Russia"
  end

  def test_lat
    assert @geobase_object.lat.to_s == "59.8983"
    assert @geobase_object.lat.instance_of? Float
  end

  def test_lon
    assert @geobase_object.lon.to_s == "30.2618"
    assert @geobase_object.lon.instance_of? Float
  end
end
