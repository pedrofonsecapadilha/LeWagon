require_relative "../views/posts_view"
require_relative "../models/post"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    posts = Post.all
    @view.display(posts)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask_for("Title")
    url = @view.ask_for("URL")
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    id = @view.ask_id
    title = @view.ask_for("Title")
    url = @view.ask_for("URL")
    post = Post.find(id).first
    post.title = title
    post.url = url
    post.save
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    id = @view.ask_id
    post = Post.find(id).first
    post.destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    id = @view.ask_id
    post = Post.find(id).first
    post.votes += 1
    post.save
  end

  def find
    id = @view.ask_id
    post = Post.find(id)
    @view.display(post)
  end
end
