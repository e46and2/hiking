require 'open-uri'
require 'nokogiri'

class Hiking::Scraper

attr_accessor :state_card, :page
attr_reader :input

def self.scrape
@page = Nokogiri::HTML(open("https://www.hikingproject.com/directory/areas"))
@state_card = @page.css("div.card.area-card")
self.scrape_states
end

def self.scrape_states
@state_card.each_with_index do |info, i|
number = i + 1
state_name = info.css("div.card-block.area-info").css("h3.dont-shrink.serif").text
total_featured_hikes = info.css("div.card-block.area-info").css("p").text.split("Hikes")[0]+"Hikes"
total_trails = info.css("div.card-block.area-info").css("p").text.split("Hikes").last
url = info.css("a").attribute("href").value
state_info = Hiking::State.new(number, state_name, total_featured_hikes, total_trails, url)
end
end

def self.scrape_trails(input)
  info = Hiking::State.all.detect{|n| n.number == input}
  url = info.url

  @page = Nokogiri::HTML(open(url))
  @state_trails = @page.css("div.card-body")

  @state_trails.each_with_index do |info|
  trail_name = info.css("h4.card-title.text-black.text-truncate").text
  featured_trails = Hiking::Trails.new(trail_name)
  end
end

end
