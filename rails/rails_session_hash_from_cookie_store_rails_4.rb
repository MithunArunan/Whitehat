#!/usr/bin/env ruby


require 'rubygems'
require 'cgi'
require 'active_support'

def decrypt_session_cookie(cookie, key)
  cookie = CGI::unescape(cookie)
    
      # Default values for Rails 4 apps
        key_iter_num = 1000
          key_size     = 64
            salt         = "encrypted cookie"         
              signed_salt  = "signed encrypted cookie"  
              
                key_generator = ActiveSupport::KeyGenerator.new(key, iterations: key_iter_num)
                  secret = key_generator.generate_key(salt)
                    sign_secret = key_generator.generate_key(signed_salt)
                    
                      encryptor = ActiveSupport::MessageEncryptor.new(secret, sign_secret)
                        puts encryptor.decrypt_and_verify(cookie)
                        end
                        
                        cookie = ARGV[0]
                        key = ARGV[1]
                        decrypt_session_cookie(cookie, key)
