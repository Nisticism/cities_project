class Scraper 
  
  def self.scrape_cities
    html = open("https://en.wikipedia.org/wiki/List_of_European_cities_by_population_within_city_limits")
    doc = Nokogiri::HTML(html)
    
    # start looping through rows
    doc.css("tbody")[0].css("tr").each do |city|
      
      city_name = ""
      city_url = ""
      city_country = ""
      city_population = ""
      
      # start looping through elements in each row
      city.css("td").each_with_index do |city_element, index|
        if index == 1
          city_name = city_element.text.split("[")[0]
          
          #city_name_array = city_name.split("[")
          #city_name = city_name_array[0]
          
          city_url = city_element.css("a")
        elsif index == 2 
          city_country = city_element.text 
        elsif index == 3
          city_population = city_element.text
        else
        end
        
        #end row loop
      end
      
      City.new(city_name, city_url, city_country, city_population) if city_name != ""
    
    #end row loop
    end
    
  end
  
  def self.scrape_city_details(city)
    
  end
  
end