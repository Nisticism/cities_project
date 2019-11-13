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
  cities = []
  doc.css("tbody")[0].css("tr").each do |city|
    city_name = ""
    city.css("td").each_with_index do |city_element, index|
      if index == 1
        city_name = city_element.text
        city_name_array = city_name.split("[")
        city_name = city_name_array[0]
      end
    end
    if city_name != ""
      cities << city_name
    end
  end
  
  cities.each.with_index(1) do |city, index|
    puts "#{index}. #{city}"
  end
  
end
