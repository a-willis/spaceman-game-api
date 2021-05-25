require 'faraday'
require 'ap'
require 'json'

def create_game_
  url = 'http://localhost:3000/games'

  response = Faraday.post(url, '{}',
  "Content-Type" => "application/json")
  id = response.body[11..13].to_i

  puts response.body
  puts
  puts response.body[11..13]
  puts id
  return id

end

def calculate_next_guess
  alphabet = "a".."z"
  alphabet_arr = alphabet.to_a
  alphabet_arr.sample
end

def make_a_guess(guess, id)
  letter_guess = guess
  puts "letter guess: #{letter_guess}"
  a = '{"guess": "'+ "#{letter_guess}" + '"}'

  puts a
  url = 'http://localhost:3000/games/' + "#{id}"
  puts url
  response = Faraday.put(url, a, "Content-Type" => "application/json")
  return response.body
  puts response.body
end 

def random_guesses(id)
  loop do
    next_guess = calculate_next_guess()
    puts "next guess: #{next_guess}"

    resp = JSON.load(make_a_guess(next_guess, id))
    puts "resp: #{resp}"

    break if resp['game_over']
  end 
end 

game_id = create_game_ 
random_guesses(game_id)

# create a game 
# save id returned 
# url = /games/#{id}
# loop do
# loop do
#   next_guess = calculate_next_guess()
#   resp = make a guess (next_guess)
  
#   break if resp.game_over
# end