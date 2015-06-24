def create_deed_data(deed_file)
  ### Read data from the supplied json filename
  deed_json = File.read('./data/' + deed_file + '.json')
  deed_hash = JSON.parse(deed_json)
  ### Setup a POST request to the deed API to insert the data
  url = URI.parse($DEED_API_URL + "/deed/")
  connection = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Post.new(url)
  request.body = "[#{deed_json}]"
  ### Execute the created request against the deed API and return the response
  response = connection.request(request)
  #if response.code == 200
    deed_hash
  #end
end

def delete_deed_data(md_ref)
  url = URI.parse($DEED_API_URL + "/deed/" + md_ref)
  connection = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Delete.new(url)
  response = connection.request(request)
  response.body
end
