class Scraper 
  
  def self.scrape_cities
    html = open("https://en.wikipedia.org/wiki/List_of_European_cities_by_population_within_city_limits")
    doc = Nokogiri::HTML(html)
    
    # start looping through rows
    doc.css("tbody")[0].css("tr").each do |city|
      
      # start looping through elements in each row
      
      if city.css("td").text != ""
        new_city = City.new
      
        city.css("td").each_with_index do |city_element, index|
          if index == 1
            new_city.name = city_element.text.split("[")[0].strip
            new_city.url = city_element.css("a").attribute("href").value
          elsif index == 2
          
            Country.all.each do |country|
              if city_element.text.strip.gsub(/[^0-9A-Za-z]/, '') == country.name
                new_city.country = country
                country.add_city(new_city)
              end
            end
            
            if new_city.country == nil
              new_country = Country.new(city_element.text.strip.gsub(/[^0-9A-Za-z]/, ''))
              new_city.country = new_country
              new_country.add_city(new_city)
            end
          elsif index == 3
            new_city.population = city_element.text.strip
          else
            #  Do nothing...
          end
            
          #end element loop
        end
        
        scrape_city_details(new_city)
      end
    
    #end row loop
    end
    
  end
  
  def self.scrape_city_details(city)
    html = open("https://en.wikipedia.org/#{city.url}")
    doc = Nokogiri::HTML(html)
    
    city_description = doc.css("p")
    
    city_description_string = ""
    city_description.css("p").each_with_index do |paragraph, index|
      if index == 3 || index == 4
        city_description_string += paragraph.text
      end
    end
    
    city.description = city_description_string
    
  end
  
end