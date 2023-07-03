require "csv"
require 'open-uri'
require 'nokogiri'

##########################
### Listar Gifts
##########################
def list(gifts)
  # Itera por cada gift no array de gifts
  gifts.each_with_index do |gift, index|

    bought = gift[:bought] ? '[X]' : '[ ]'

    # Mostra um gift na tela
    puts "#{index + 1} - #{bought} #{gift[:name]}"
  end
end

##########################
### Adicionar um novo gift
##########################
def add(gifts)
  # Pergunta a descrição do fift
  puts "Enter your gift: "
  name = gets.chomp

  # Adiciona o novo gift ao array de gifts
  gifts << { name: name, bought: false }

  # Salva o array
  save_csv(gifts)
end

##########################
### Remove um gift
##########################
def delete(gifts)

  # Mostra todos os gifts
  list(gifts)

  # Pergunta o index do gift a ser excluído
  puts "Enter the index of gift to delete: "
  index = gets.chomp.to_i - 1

  # Verifica se o gift está dentro do index do array de gift
  if index >= 0 && index < gifts.count
    # Remove pelo index
    gifts.delete_at(index)
    # Salva o array
    save_csv(gifts)
  else # Usuário digitou um index que não existe
    puts "Invalid gift index"
  end
end

##########################
### Marca um gift como comprado
##########################
def mark(gifts)

  # Mostrou todos os gifts
  list(gifts)

  # Perguntou o index
  puts "Did you buy any of the gift? (Give the index)"
  index = gets.chomp.to_i - 1

  # Pegamos o hash do gift dentro do array de gifts
  gift = gifts[index]
  # Alteramos o valor da chave bought para tru indicado que esse gift foi comprado
  gift[:bought] = true

  # Salvamos no CSV
  save_csv(gifts)
end

##########################
### Importa um producto da kabum.com.br
##########################
def import(gifts)
  # Perguntar qual o produto a pesquisar na kabum
  puts "Enter product to import:"

  # Substituimos o espaço por hifem para não quebrar a URL
  product = gets.chomp.gsub(' ', '-')

  # Monta a URL da Kabum
  url = "https://www.kabum.com.br/busca/#{product}"

  # Identifica como um browser
  user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36"

  # Carrega o código fonte do site como string
  html = URI.open(url, "User-Agent" => user_agent).read
  # Converte em um objeto Nokogiri que permite procurar por CSSselectors
  html_doc = Nokogiri::HTML(html)

  # O CSS Select class nameCard contém cada nome de produto da página
  products = html_doc.search('.nameCard').first(5) # pegamos somente os 5 primeiros

  names = [] # Armazenas os nomes dos produtos da kabum
  products.each_with_index do |name, index| # Para cada produto encontrado na página
    puts "#{index + 1} - #{name.text}" # Mostramos ao usuário
    names << name.text # Armazenamos para poder importar posteriomente
  end

  # Perguntar o index do produto que mostramos ao usuário
  puts "What product index to import:"
  index = gets.chomp.to_i - 1

  # Encontrar o produto na array de names que criamos acima
  name = names[index]

  puts "Importando #{name}..."

  # Criamos um hash com o novo gift e adicionamos ao nosso array de gifts
  gifts << {name: name, bought: false}

  # Salvamos no CSV
  save_csv(gifts)
end


##########################
### Salva o arquivo CSV
##########################
def save_csv(gifts)
  # Abre o arquivo gifts.csv
  CSV.open("gifts.csv", "wb") do |csv|
    # Itera por cada elemento do array de gifts
    gifts.each do |gift|
      # Insere um gift como uma linha do arquivo de CSV
      csv << [gift[:name], gift[:bought]]
    end
  end
end

##########################
### Carregar arquivo CSV
##########################
def load_csv(gifts)
  # Para cada linha do arquivo gifts.csv
  CSV.foreach("gifts.csv") do |row|
    # Pegamos o name do arquivo CSV
    name = row[0]
    # Pegamos se foi comprado do arquivo de CSV
    bought = row[1] == 'true'

    # Montamos o hash de um gift e adicionamos ao nosso array de gifts
    gifts << {name: name, bought: bought}
  end
end

# Criamos um array de gifts vazio
gifts = []

# Carregamos nosso array de gifts com os dados do arquivo de CSV
load_csv(gifts)


####################################
# NOSSA INTERFACE COMEÇA AQUI
####################################

# Mensagem de boas vindas
puts "Welcome to our X-mas list"

# início do Loop
loop do
  # Listar quais as opções
  puts "Select your option [list|add|delete|mark|import|quit]?"
  # Pergunta o que você quer fazer
  user_option = gets.chomp.downcase
  # Executar a ação do usuário
  case user_option
  when "list"
    list(gifts)
  when "add"
    add(gifts)
  when "delete"
    delete(gifts)
  when "mark"
    mark(gifts)
  when "import"
    import(gifts)
  when "quit"
    break
  else
    puts "Invalid option"
  end
  # Voltar para o início do loop
end
# Mensagem de despedida
puts "See you next time"
