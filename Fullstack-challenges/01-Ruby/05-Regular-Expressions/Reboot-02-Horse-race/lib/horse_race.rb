HORSE_LIST = ["Saudosa", "Loirinho", "Majestosa", "Pé de Pano"]

def horse_race(horse_chosen)
  puts "\nStarting the race..."

  horse_win = ""
  3.times do |count|
    horse = HORSE_LIST.sample
    puts "Lap #{count + 1}: The horse #{horse} is in the first place."
    sleep(1.5) # Pausa por segundos a repetição.
    horse_win = horse
  end
  puts "The race finished! The winner is #{horse_win.upcase}!!!"
  horse_win
end
