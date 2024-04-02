require 'rss'
require 'open-uri'

puts "Welcome to My Terminal RSS Feeder"
sleep(2)
puts "Please enter the RSS url you want to read."
sleep(1)
puts "If you don't have a URL, press Enter to use the default feed"
url = gets.chomp

if url.empty?
  url = 'http://feeds.feedburner.com/ign/news'
  puts "No URL provided. Using the default feed."
end

begin
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    puts "Title: #{feed.channel.title}"
    feed.items.each do |item|
      puts "Item: #{item.title}"
      puts "*-*-*-*-*-*-*-"
    end
end

rescue StandardError => e
    puts "Error occurred while fetching or parsing the RSS feed: #{e.message}"
end

sleep(1)
puts "************************************************************"
puts "Thank you for using my Feed Reader. Developed by: Paulo Santos"