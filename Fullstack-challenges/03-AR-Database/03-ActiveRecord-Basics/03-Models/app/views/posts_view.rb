class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display(array)
    array.each do |post|
      puts "ID: #{post.id} | Title: #{post.title} | URL: #{post.url} | Votes: #{post.votes}"
    end
  end

  def ask_for(label)
    puts "What's #{label} of your post?"
    print "> "
    gets.chomp
  end

  def ask_id
    puts "What's the ID you're looking for:"
    print "> "
    gets.chomp.to_i
  end
end
