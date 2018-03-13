require 'net/http'
require 'json'
require 'uri'
 
def find_location 
	url = 'https://ipapi.co/'+208.67.222.222+'/json/'
	loc = Net::HTTP.get('https://ipapi.co/208.67.222.222/json/')
	puts JSON.parse(loc)
end


sources_file = ARGV.first
uris = read_uris_from_file(sources_file)
download_resources(uris)