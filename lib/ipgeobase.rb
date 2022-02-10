# frozen_string_literal: true

require_relative "ipgeobase/version"
require "net/http"
require "addressable/uri"
require "addressable/template"

# Returns Metadata object
module Ipgeobase
  require_relative "ipgeobase/meta"

  class Error < StandardError; end

  def self.lookup(ip_address)
    template = Addressable::Template.new("http://ip-api.com/xml/{?query*}")
    response = Net::HTTP.get(template.expand({ "query" => ip_address }))

    Meta.parse(response)
  end
end
