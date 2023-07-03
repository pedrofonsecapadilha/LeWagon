require "json"
require "rest-client"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.

response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
repos = JSON.parse(response)

# => repos is an `Array` of `id`.

repos.first(10).each do |id|
  url = "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
  post_response = RestClient.get(url)
  post_repos = JSON.parse(post_response)
  post = Post.new(title: post_repos["title"], url: post_repos["url"], votes: post_repos["score"])
  post.save!
end
