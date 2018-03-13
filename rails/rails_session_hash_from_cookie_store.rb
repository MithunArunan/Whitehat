#!/usr/bin/env ruby

require "net/http"
require 'openssl'
require 'uri'
require 'pp'
require 'base64'

class RailsSessionHashFromCookieStore
	def serialized_hash session_cookie
		decoded_session_cookie = URI.decode(session_cookie)
		base64_decoded_session_cookie = Base64.decode64(decoded_session_cookie)
		session_hash = Marshal.load(base64_decoded_session_cookie)
		puts session_hash
	end
end

object = RailsSessionHashFromCookieStore.new
object.serialized_hash ARGV[0]
