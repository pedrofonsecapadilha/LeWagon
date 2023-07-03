require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative "../config/application"

set :root, File.expand_path("..", __dir__)
set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  # TODO
  # 1. fetch posts from database.
  # 2. Store these posts in an instance variable
  # 3. Use it in the `app/views/posts.erb` view
  @posts = Post.all
  if @posts.empty?
    "There is no Posts yet ):"
  else
    erb :posts # Do not remove this line
  end
end

get "/post/:id" do
  @post = Posts.find(params[:id])
  if @post.nil?
    erb :error
  else
    erb :show
  end
end

# TODO: add more routes to your app!
