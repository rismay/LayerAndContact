require 'addressable/uri'
require 'rest-client'

def create
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.json'
  ).to_s

  puts RestClient.post(url, { :user => { :name => "too_much_ku$h"} })
end

def delete_contact_share
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contact_shares/1.json'#,
  # query_value: {id: 1}
  ).to_s

  puts RestClient.delete(url)
end

p delete_contact_share