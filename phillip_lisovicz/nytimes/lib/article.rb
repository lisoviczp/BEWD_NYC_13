
# Most Viewed Popular Article class

class Article
  attr_reader :title, :byline, :section, :description, :date, :url

  def initialize(title, byline, section, description, date, url)
    @title = title
    @byline = byline
    @section = section
    @description = description
    @date = date
    @url = url
  end

end