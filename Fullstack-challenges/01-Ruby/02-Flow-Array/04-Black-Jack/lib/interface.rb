require_relative "croupier"

# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card

message = nil
card = 0
bank = pick_bank_score

while message != "n"
  puts "Card? 'y' to get a new card or 'n' to finish"
  print "> "
  message = gets.chomp
  puts "\n"
  puts state_of_the_game(card = card + pick_player_card, bank) if message != "n"
end

puts end_game_message(card, bank)
