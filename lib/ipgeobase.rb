# frozen_string_literal: true

require_relative "ipgeobase/version"
require "net/http"
require "addressable/uri"
require "addressable/template"
require_relative "meta"

module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip_address)
    template = Addressable::Template.new("http://ip-api.com/xml/{?query*}")
    response = Net::HTTP.get(template.expand({ "query" => ip_address }))

    Meta.parse(response)
  end
end
