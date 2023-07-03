require_relative "config/application"
require "sqlite3"
require_relative "router"

dir = File.dirname(__FILE__)
DB = SQLite3::Database.new(File.join(dir, "db/posts.db"))

Dir[File.join(dir, "app/**/*.rb")].sort.each { |file| require file }

Router.new.run
