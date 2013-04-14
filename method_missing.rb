require 'net/http'
require 'uri'
class DynamicProxy
  def method_missing(m, *args)
    uri = URI.parse("http://example.com/#{m}")
    Net::HTTP.get_response(uri).body
  end
end

DynamicProxy.new.users
# => returns data from
# http://example.com/users