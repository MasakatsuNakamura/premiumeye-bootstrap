# coding: utf-8

require 'rss'
require 'net/https'
require 'json'

CW_API_TOKEN = "1920acecd1a439250877f8d0bc5f94fe"
ROOM_ID = "79640651"

def post_cw(data)
  uri = URI('https://api.chatwork.com/v2/rooms/' + ROOM_ID + '/messages')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  header = { "X-ChatWorkToken" => CW_API_TOKEN }
  body = "body=" + URI.encode(data)

  res = http.post(uri, body, header)
  puts JSON.parse(res.body)
end

post_cw(ARGV[0])
