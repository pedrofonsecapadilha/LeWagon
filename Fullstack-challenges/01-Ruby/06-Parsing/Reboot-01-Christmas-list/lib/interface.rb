require "csv"
require "open-uri"
require "nokogiri"

def list(gifts)
  gifts.each_with_index do |gift, i|
    bought = gift[:bought] ? "[X]" : "[ ]"
    puts "#{i + 1} - #{bought} #{gift[:name]}"
  end
end

def add(gifts)
  puts "Enter your add gift: "
  name = gets.chomp
  gifts << { name: name, bought: false }
  save_csv(gifts)
end

def delete(gifts)
  list(gifts)
  puts "Enter the index of gift to delete: "
  index = gets.chomp.to_i - 1
  if index >= 0 && index < gifts.count
    gifts.delete_at(index)
    save_csv(gifts)
  else
    puts "Ivalid gift index"
  end
end

def mark(gifts)
  list(gifts)
  puts "Did you buy any gift? (give the index) "
  index = gets.chomp.to_i - 1
  gift = gifts[index]
  gift[:bought] = true
  save_csv(gifts)
end

def import(gifts)
  puts "Enter product to import with kabum site"
  product = gets.chomp.gsub(" ", "-")
  url = "https://www.kabum.com.br/busca/#{product}"
  user_agent = "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0"

  html = URI.open(url, "User-Agent" => user_agent).read
  html_doc = Nokogiri::HTML(html)

  products = html_doc.search(".nameCard").first(5)

  names = []
  products.each_with_index do |name, index|
    puts "#{index + 1} - #{name.text}"
    names << name.text
  end

  puts "What product index to import:"
  index = gets.chomp.to_i - 1
  name = names[index]
  puts "Importing #{name} ..."
  gifts << { name: name, bought: false }

  save_csv(gifts)
end

def save_csv(gifts)
  CSV.open("gifts.csv", "wb") do |csv|
    gifts.each do |gift|
      csv << [gift[:name], gift[:bought]]
    end
  end
end

def load_csv(gifts)
  CSV.foreach("gifts.csv") do |row|
    name = row[0]
    bought = row[1] == "true"
    gifts << { name: name, bought: bought }
  end
end

###################################################
# NOSSA INTERFACE COMEÇA AQUI
###################################################

gifts = []
load_csv(gifts)

# 1. Welcome
puts "Welcome to our Christmas gift list"
# Retorno do loop
loop do
  # 2. Display menu (list / add / delete / mark / quit )
  puts "Which action [list|add|delete|mark|import|quit]?"
  # 3. Get user action
  user_option = gets.chomp.downcase
  # 4. Perform the right action
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
  # 5. Voltar para o início do loop
end
# 6. Mensagem de despedida
puts "Goodbye"
