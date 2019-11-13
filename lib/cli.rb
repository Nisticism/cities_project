require 'nokogiri'
require 'open-uri'

# document.querySelectorAll("tbody")[0].querySelectorAll("td")[1].innerText

def start 
  puts "Welcome to City Scraper"
  puts "These are the most populous cities in Europe:"
  puts " "
  puts "--------------------------------------"
  puts " "
  
  html = open("https://en.wikipedia.org/wiki/List_of_European_cities_by_population_within_city_limits")
  doc = Nokogiri::HTML(html)
  doc.css("tbody").each do |city|
    city_name = city.css("td").text
  end
  
  binding.pry
end
