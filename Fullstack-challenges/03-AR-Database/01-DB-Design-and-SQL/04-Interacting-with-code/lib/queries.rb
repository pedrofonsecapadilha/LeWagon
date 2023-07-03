require 'sqlite3'

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  query = <<~SQL
    SELECT COUNT(*) FROM artists;
  SQL
  rows = db.execute(query)
  rows.flatten.first
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  query = <<~SQL
    SELECT COUNT(*) FROM #{table_name};
  SQL
  rows = db.execute(query)
  rows.flatten.first
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  query = <<~SQL
    SELECT name FROM artists ORDER BY name;
  SQL
  rows = db.execute(query)
  rows.flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names
  query = <<~SQL
    SELECT name FROM tracks;
  SQL
  rows = db.execute(query)

  rows.flatten.select do |music|
    music.downcase.include?("love") # BUSCAR NO SQL = WHERE LIKE "%love%"
  end
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  millisec = (min_length * 60_000)
  query = <<~SQL
    SELECT name FROM tracks WHERE milliseconds > #{millisec} ORDER BY milliseconds;
  SQL
  rows = db.execute(query)
  rows.flatten
end
