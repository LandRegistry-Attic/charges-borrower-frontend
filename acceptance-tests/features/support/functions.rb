def create_deed_data(deed)
  url = URI.parse($DEED_API_URL + "/deed/")
  connection = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Post.new(url)
  request.body = "[#{deed}]"
  response = connection.request(request)
  response.body
end

def delete_deed_data
  url = URI.parse($DEED_API_URL + "/deed/" + "1")
  connection = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Delete.new(url)
  response = connection.request(request)
  response.body
end