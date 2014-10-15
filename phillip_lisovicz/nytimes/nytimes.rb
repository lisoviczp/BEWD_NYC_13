require 'rest-client'
require 'pry'
require 'json'
require_relative 'lib/article'


#get user input
puts 'Welcome to the NYTimes Popular Article look up program.'
puts "We're going to look at the most popular articles in the NYTimes"
puts "Enter your definition for 'Popular' (choose from 'shared', 'emailed', or 'viewed'): "
a1 = gets.strip
puts "Enter the section of NYT that you want to filter on: (choose from 'all sections', 'health', 'job market', 'magazine',
  'movies', 'multimedia', 'opinion', 'real estate', 'science', 'sunday review', 'technology', 'the upshot', 'theater', 'travel', 'U.S.', 'world', 'your money'): "
a2 = gets.strip
a2 = a2.downcase.gsub(' ', '-')
puts "Enter how much content you want, in terms of days (1,7,30): "
a3 = gets.strip
if a3.class != Fixnum
  a3 = 30
else
  a3 = a3.to_i
  if a3 == 30
    a3 = 30
  elsif a3 == 7
    a3 = 7
  elsif a3 == 1
    a3 = 1
  elsif a3.class != Fixnum
    a3 = 30
  end
end


if a1 == 'shared'
  a1 = 'mostshared'
elsif a1 == 'emailed'
  a1 = 'mostemailed'
elsif a1 == 'viewed'
  a1 = 'mostviewed'
else
  a1 = 'mostviewed'
end


# most viewed popular -- test url, works
# url = 'http://api.nytimes.com/svc/mostpopular/v2'
# url << '/mostviewed/all-sections/30.json?offset=40'
# url << '&api-key=0fec9dbf33ac5c007d5abc3cecc99e94:12:69947335'

# most viewed -- test url, works
# surl='http://api.nytimes.com/svc/mostpopular/v2/mostviewed/u.s./30.json?'
# surl << '&api-key=0fec9dbf33ac5c007d5abc3cecc99e94:12:69947335'

surl = "http://api.nytimes.com/svc/mostpopular/v2/#{a1}/#{a2}/#{a3}.json?"
surl << "&api-key=0fec9dbf33ac5c007d5abc3cecc99e94:12:69947335"

response = RestClient.get(surl)
parsed_response = JSON.parse(response)
results = parsed_response['results']


# list of Article Objects
articles = []

results.each do |result|
  temp_article = Article.new result['title'], result['byline'], result['section'], result['abstract'], result['published_date'], result['url']
  articles << temp_article
end


if articles.empty?
  puts 'Your query returned nothing. Try again if you wish.'
else 
  n = 1
  articles.each do |article|
    puts "#{n}."
    puts "Title: #{article.title}" 
    puts "#{article.byline}" 
    puts "Section: #{article.section}" 
    puts "Description: #{article.description}" 
    puts "Published: #{article.date}" 
    puts "URL: #{article.url}"
    puts
    n += 1
  end
end

#binding.pry






