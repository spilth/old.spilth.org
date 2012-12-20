require 'readline'
require 'date'

desc "Create a new blog post"
task :blog do
  # Ask for blog title
  title = Readline.readline('Post Title: ', true)
  title_file = title.downcase
  puts "Title is: #{title}"

  date = DateTime.now
  filename = date.strftime("_posts/%Y-%m-%d-#{title_file}.md")
  
  # Create dated file
  # With Front Matter

  # Start vim with file
end

