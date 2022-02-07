# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  def setup
    stub_request(:get, "http://ip-api.com/xml/?query=188.243.183.134")
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "User-Agent" => "Ruby"
        }
      )
      .to_return(status: 200, body: "
    <query>
      <status>success</status>
      <country>Russia</country>
      <countryCode>RU</countryCode>
      <region>SPE</region>
      <regionName>St.-Petersburg</regionName>
      <city>St Petersburg</city>
      <zip>190098</zip>
      <lat>59.8983</lat>
      <lon>30.2618</lon>
      <timezone>Europe/Moscow</timezone>
      <isp>SkyNet LLC</isp>
      <org>SkyNet Networks</org>
      <as>AS35807 SkyNet Ltd.</as>
      <query>188.243.183.134</query>
    </query>
    ", headers: {})

    @geobase_object = Ipgeobase.lookup("188.243.183.134")
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_country
    assert @geobase_object.country == "Russia"
  end

  def test_city
    assert @geobase_object.city == "St Petersburg"
  end
end
