require 'faraday'
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

def calculate_next_guess(int)
  alphabet = ("a".."z").to_a
  a = alphabet[int]
return a

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
  int = 0
  loop do
    next_guess = calculate_next_guess(int)
    int += 1

    puts "next guess: #{next_guess}"

    resp = JSON.load(make_a_guess(next_guess, id))
    puts "resp: #{resp}"

    break if resp['game_over']
  end 
end 

game_id = create_game_ 
random_guesses(game_id)
