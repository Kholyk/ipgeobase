# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ipgeobase"

require "minitest/autorun"

require "webmock/minitest"

def get_fixture_content(name)
  raw_response_file = File.new("test/fixtures/#{name}.xml")
  File.open(raw_response_file)
end
