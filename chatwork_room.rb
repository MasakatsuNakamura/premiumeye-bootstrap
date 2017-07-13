# encoding: utf-8

require 'rss'
require 'net/https'
require 'json'

CW_API_TOKEN = "1920acecd1a439250877f8d0bc5f94fe"

def get_room
  uri = URI('https://api.chatwork.com/v2/rooms')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  header = { "X-ChatWorkToken" => CW_API_TOKEN }
  body = nil

  res = http.get(uri, header)
  rooms = JSON.parse(res.body)

  rooms.each do |room|
    puts "#{room['room_id']}, #{room['name']}"
  end
end

get_room
