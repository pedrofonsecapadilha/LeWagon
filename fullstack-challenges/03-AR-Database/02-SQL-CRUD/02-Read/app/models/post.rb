# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

require "pry"

class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes)
    @id = attributes[:id] || attributes["id"]
    @title = attributes[:title] || attributes["title"]
    @url = attributes[:url] || attributes["url"]
    @votes = attributes[:votes] || attributes["votes"]
  end

  def self.find(id)
    DB.results_as_hash = true
    new_post = DB.execute('SELECT * FROM posts WHERE id = ?', id)
    if new_post.empty?
      nil
    else
      Post.new(id: new_post.first["id"], title: new_post.first["title"],
               url: new_post.first["url"], votes: new_post.first["votes"])
    end
  end

  def self.all
    DB.results_as_hash = true
    posts = DB.execute("SELECT * FROM posts")
    posts.map { |post| Post.new(post) }
  end
end
