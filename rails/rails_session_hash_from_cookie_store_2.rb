#!/usr/bin/env ruby

# decode_session_cookie.rb
# ------------------------
# The purpose of this script is to show that if I have the secret_key_base
# and a cookie to an active Rails session, I can decrypt it and gain access
# to key information about the user's session.

require 'rubygems'
require 'cgi'
require 'active_support'
require 'action_controller'

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
                    
                      encryptor = ActiveSupport::MessageEncryptor.new(secret, sign_secret, serializer: ActiveSupport::MessageEncryptor::NullSerializer)
                        puts Marshal.load(encryptor.decrypt_and_verify(cookie))
                        end
                        
                        
                        # Time to test ... (With data from Arbeit327)
                        cookie = ARGV[0]
                        key = ARGV[1]
                        
                        decrypt_session_cookie(cookie, key)
                        
                        
