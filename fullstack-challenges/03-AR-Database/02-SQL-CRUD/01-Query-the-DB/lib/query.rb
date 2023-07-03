require 'sqlite3'

def all_artists(db)
  # TODO: use `db` to execute an SQL query against the database to
  # retrieve all columns from all records from the `artists` table.
  query = <<~SQL
    SELECT *
    FROM artists;
  SQL
  rows = db.execute(query)
end
