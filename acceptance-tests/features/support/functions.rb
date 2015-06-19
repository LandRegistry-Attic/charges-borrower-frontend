def create_deed_data
  url = URI.parse($DEED_API_URL + "/deed/")
  connection = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Post.new(url)
  data = {"Testing" => "123"}.to_json
  request.body = "[#{data}]"
  response = connection.request(request)
  response.body
end
