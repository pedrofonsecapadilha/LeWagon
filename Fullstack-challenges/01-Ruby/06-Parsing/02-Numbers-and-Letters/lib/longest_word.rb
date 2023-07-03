require 'open-uri'
require "pry"

def generate_grid(grid_size)
  result = []
  grid_size.times { result << ("A".."Z").to_a.shuffle[rand(26)] }
  result
end

def run_game(attempt, grid, start_time, end_time)
  score = 0
  message = "Well done!"

  score += attempt.length * 2
  score += -(end_time - start_time) + 100

  url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  html = URI.open(url).read

  if html[/:true/] == ":true"
    score += 50

    attempt.upcase.chars.each do |letter|
      if grid.include?(letter)
        grid.delete_at(grid.index(letter))
      else
        score = 0
        message = "Not in the grid!"
      end
    end

  else
    score = 0
    message = "Not an english word!"
  end

  { time: (end_time - start_time), score: score, message: message }
end
