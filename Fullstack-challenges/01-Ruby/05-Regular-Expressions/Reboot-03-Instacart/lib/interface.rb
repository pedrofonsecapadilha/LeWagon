# TODO: you can build your instacart program here!

# 1. MENSSAGEM DE BOAS VINDAS
puts "Olá, bem vinde ao Instacart!
Esses são os nossos produtos:"

# 2. DEFINIR A HASH COM CADASTRO DOS ITENS
store = {
  banana: { price: 1.25, quantity: 5 },
  peach: { price: 0.25, quantity: 10 },
  apple: { price: 0.75, quantity: 3 }
}
# 3. MOSTRAR OS ITENS DISPONÍVEIS NA LOJA
store.each do |item, attributes|
  puts "> #{item}: $#{attributes[:price]} (#{attributes[:quantity]} availabel)"
end

# 4. CRIAMOS UMA VARIÁVEL QUE IRÁ REPRESENTAR O CARRINHO DE COMPRAS
cart = {}
total = 0

# 5. PEGAR OS ITENS QUE O CLIENTE IRÁ ESCOLHER
loop do
  puts "Qual item você deseja comprar? (Ou digite 'sair')"
  item = gets.chomp
  break if item == "sair"

  if store.include?(item.to_sym)
    puts "Qual a quantidade você deseja?"
    user_quantity = gets.chomp.to_i
    if store[item.to_sym][:quantity] >= user_quantity
      # 8. adicionamos o produto e sua respectiva quantidade ao cart
      cart[item.to_sym] = { price: store[item.to_sym][:price], quantity: user_quantity }
      # 9. ATUALIZAMOS A QUANTIDADE EM ESTOQUE DO ITEM
      store[item.to_sym][:quantity] -= user_quantity
    else
      puts "Desculpe, este produto tem apenas #{store[item.to_sym][:quantity]} unidades em estoque."
    end
  else
    # CASO O PRODUTO NÃO EXISTA, PRECISAMOS RETORNAR UMA MENSAGEM DE PRODUTO INEXISTENTE
    puts "Desculpe, produto inválido."
  end
end

puts "-----------------CONTA-----------------"
cart.each do |item, attributes|
  # SOMANDO O VALOR TOTAL DOS ITENS COMPRADOS (PREÇO * QUANTIDADE)
  total += attributes[:price] * attributes[:quantity]
  puts "#{item}: $#{store[item.to_sym][:price] * attributes[:quantity]}"
end
puts "TOTAL: $#{total}"
puts "-----------------CONTA-----------------"
