require 'sqlite3'
require 'pry'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  # Hint: you will have to use two JOIN sql statements.
  query = <<~SQL
    SELECT tracks.name, albums.title, artists.name
    FROM tracks
    JOIN albums ON albums.id = tracks.album_id
    JOIN artists ON artists.id = albums.artist_id;
  SQL
  rows = db.execute(query)
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)

  query = <<~SQL
    SELECT COUNT(*), SUM(milliseconds)
    FROM tracks
    JOIN genres ON genres.id = tracks.genre_id
    WHERE genres.name LIKE "#{genre_name}"
  SQL
  rows = db.execute(query).flatten

  { avg_length: ((rows[1].to_f / 60 / 1000) / rows[0]).round(2), category: genre_name, number_of_songs: rows[0] }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = <<~SQL
    SELECT artists.id, artists.name, COUNT(tracks.name) AS tracks_count
    FROM tracks
    JOIN genres ON genres.id = tracks.genre_id
    JOIN albums ON albums.id = tracks.album_id
    JOIN artists ON artists.id = albums.artist_id
    WHERE genres.name LIKE "#{genre_name}"
    GROUP BY artists.name
    ORDER BY tracks_count DESC
    LIMIT 5;
  SQL
  rows = db.execute(query)
end
