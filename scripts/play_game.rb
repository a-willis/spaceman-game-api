require 'faraday'
require 'ap'

def create_game_
  url = 'http://localhost:3000/games'

  # POST JSON content
  response = Faraday.post(url, '{}',
  "Content-Type" => "application/json")

  ap response.body

end

url = 'http://localhost:3000/games/111'

  # PUT JSON content
response = Faraday.put(url, '{"guess": "u"}', "Content-Type" => "application/json")

ap response.body

#create_game_

