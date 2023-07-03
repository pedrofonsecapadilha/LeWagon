require "date"
require "csv"

def most_successful(number, max_year, file_path)
  # TODO: return the `number` of most successful movies before `max_year`

  # SEPARAR AS INFORMAÇÕES DE FORMA QUE O RUBY LÊ
  movie_list = []
  CSV.foreach(file_path) do |row|
    movie_list << { name: row[0], year: row[1].to_i, earnings: row[2].to_i }
  end

  # FILTRAR DE ACORDO COM AS ENTRADAS DE DADOS
  # 3. LISTAR MAIORES GANHOS ASSOCIADOS
  movie_earnings = movie_list.sort_by { |movie| -movie[:earnings] }

  # 2. PUBLICADOS ANTES DE (max_year)
  result_max_year = []
  movie_earnings.each do |row|
    result_max_year << row if row[:year] < max_year
  end

  # 1. QUANTIDADE DE FILMES (number)
  # RETONA UMA HASH DA SEGUINTE FORMA: name: "Avatar", year: 2009, earnings: 760505847
  result_max_year.first(number)
end
