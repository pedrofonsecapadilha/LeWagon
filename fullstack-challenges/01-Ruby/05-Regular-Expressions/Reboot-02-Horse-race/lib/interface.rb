require_relative "horse_race"

# TODO: you can build your horse race program here!

# CRIAR UMA LISTA COM NOMES DOS CAVALOS
# PRINTAR UMA MENSAGEM DE BOAS VINDAS COM A LISTA DOS CAVALOS
# PERGUNTAR QUAL CAVALO ELE QUER APOSTAR
# COMEÇA A CORRIDA DE CAVALOS
# VERIFICAR QUAL CAVALO VENCEDOR
# PERGUNTAR SE O JOGADOR DESEJA JOGAR NOVAMENTE LOOP DO

wallet = 100
loop do
  puts "\nWelcome to the Horse Race!\nYou have $ #{wallet}."
  if wallet >= 20
    HORSE_LIST.each_with_index { |horse, index| puts "#{index + 1} - #{horse}" }

    puts "Wich horse number do you choose? [1] [2] [3] [4]?"
    horse_chosen = gets.chomp.to_i
    wallet -= 20

    puts "\nYour horse is: #{HORSE_LIST[horse_chosen - 1]}"

    if HORSE_LIST[horse_chosen - 1] == horse_race(horse_chosen)
      wallet += 50
      puts "\nUauuu, you WIN! You have $#{wallet} in your wallet know."
    else
      puts "\nYou LOSE! You have $#{wallet} in your wallet know."
    end

    puts "\nYou want to play again? [y] or [n]"
    decision = gets.chomp

    if decision == "y"
      next
    else
      puts "You finish with $#{wallet}! See you next time."
      break
    end
  else
    puts "You can't play, you don't have money. You have just $#{wallet} in your wallet! See you next time."
    break
  end
end
