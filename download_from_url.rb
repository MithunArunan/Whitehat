#!/usr/bin/env ruby

# Ruby script to download a number of files
# from individual URLs via HTTP/HTTPS/FTP

require "net/http"
require 'net/ftp'
require 'uri'

def http_download_uri(uri, filename)
  puts "Starting HTTP download for: " + uri.to_s
  http_object = Net::HTTP.new(uri.host, uri.port)
  http_object.use_ssl = true if uri.scheme == 'https'
  begin
    http_object.start do |http|
      request = Net::HTTP::Get.new uri.request_uri
      http.read_timeout = 500
      http.request request do |response|
        open filename, 'w' do |io|
          response.read_body do |chunk|
            io.write chunk
          end
        end
      end
    end
  rescue Exception => e
    puts "=> Exception: '#{e}'. Skipping download."
    return
  end
  puts "Stored download as " + filename + "."
end


def read_uris_from_file(file)
  uris = Array.new
  File.open(file).each do |line|
    line = line.strip
    next if line == nil || line.length == 0
    parts = line.split(' ')
    puts "URI from file " + Hash[ [:resource, :filename].zip(parts) ].to_s + "."
    pair = Hash[ [:resource, :filename].zip(parts) ]
    uris.push(pair)
  end
  uris
end

def download_resources(pairs)
  pairs.each do |pair|
    filename = pair[:filename].to_s
    filename_check = filename+'.mp3'
    resource = pair[:resource].to_s
    unless File.exists?(filename_check) 
      $variable = 1
      puts "Value of the variable:"+$variable.to_s
      filename += "-"+$variable.to_s+".mp3"
      download_resource(resource, filename)
    else
      $variable += 1
      puts "Value of the variable:"+$variable.to_s
      filename += "-"+$variable.to_s+".mp3"
	  download_resource(resource, filename)
    end
  end
end


def download_resource(resource, filename)
  uri = URI.parse(resource)
  case uri.scheme.downcase
  when /http|https/
    http_download_uri(uri, filename)
  when /ftp/
    ftp_download_uri(uri, filename)
  else
    puts "Unsupported URI scheme for resource " + resource + "."
  end
end

Dir.chdir("downloaded")
puts "Changed directory: " + Dir.pwd
sources_file = ARGV.first
uris = read_uris_from_file(sources_file)
download_resources(uris)