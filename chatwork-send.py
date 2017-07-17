# -*- coding: utf-8 -*-

import json
import urllib
import pycurl

api_token       = "1920acecd1a439250877f8d0bc5f94fe"
room_id         = "79640651"
room_message    = "https://api.chatwork.com/v2/rooms/{0}/messages".format(room_id)

# message = str(event['message'])
                
option = { 'body': 'test message' }
c = pycurl.Curl()
c.setopt(pycurl.URL, room_message)
c.setopt(pycurl.HTTPHEADER, ['X-ChatWorkToken:' + api_token])
c.setopt(pycurl.POST, 1)
c.setopt(pycurl.POSTFIELDS, urllib.urlencode(option))
c.perform()
c.close()
