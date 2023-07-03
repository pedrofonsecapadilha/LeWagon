def beer_plural
  puts "1 bottle of beer on the wall, 1 bottle of beer!\n"
  puts "Take one down, pass it around, no more bottles of beer on the wall!"
end

def beer_song(beer_start_count)
  # TODO: sing the song

  # 1-fazer um contador que recebe o beer_start_count e repete esse número de vezes
  if beer_start_count != 1
    puts "#{beer_start_count} bottles of beer on the wall, #{beer_start_count} bottles of beer!\n"
    (beer_start_count - 2).times do
      puts "Take one down, pass it around, #{beer_start_count - 1} bottles of beer on the wall!\n"
      puts "#{beer_start_count - 1} bottles of beer on the wall, #{beer_start_count - 1} bottles of beer!\n"
      beer_start_count -= 1
    end

    # 2-ajustar o texto plural e singular de acordo com o número
    puts "Take one down, pass it around, 1 bottle of beer on the wall!"
  end
  beer_plural
end

beer_song(ARGV[0].to_i)
