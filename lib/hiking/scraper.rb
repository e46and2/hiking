require 'open-uri'
require 'nokogiri'

class Scraper

attr_accessor :state, :state_card, :page, :total_featured_hikes, :total_trails, :url

@@all = []

def initialize(state=nil, total_featured_hikes=nil, total_trails=nil, url=nil)
@state = state
@total_featured_hikes = total_featured_hikes
@total_trails = total_trails
@url = url
end

def self.all
@@all
end

def self.scrape
@page = Nokogiri::HTML(open("https://www.hikingproject.com/directory/areas"))
@state_card = @page.css("div.card.area-card")
self.scrape_states
end

def self.scrape_states
@state_card.each do |info|
state = info.css("div.card-block.area-info").css("h3.dont-shrink.serif").text
total_featured_hikes = info.css("div.card-block.area-info").css("p").text.split("Hikes")[0]+"Hikes"
total_trails = info.css("div.card-block.area-info").css("p").text.split("Hikes").last
url = info.css("a").attribute("href").value
state_info = Scraper.new(state, total_featured_hikes, total_trails, url)
@@all << state_info
end
@@all
end


end
