

# document.querySelectorAll("tbody")[0].querySelectorAll("td")[1].innerText


class CLI 
  def start 
    puts "Welcome to City Scraper"
    puts "These are the most populous cities in Europe:"
    puts " "
    puts "---------------------------------------------"
    puts " "
    City.clear_all
    Country.clear_all
    Scraper.scrape_cities
    #binding.pry
      
    print_cities
    print_urls
    print_countries
    print_populations
      
  end
    
  def menu
    
  end 
    
    
  def print_cities
    City.all.each_with_index do |city, index|
      puts "#{index + 1}. #{city.name}"
    end
  end
  
  def print_urls
    City.all.each_with_index do |city, index|
      puts "#{index + 1}. #{city.url}"
    end
  end
  
  def print_countries
    City.all.each_with_index do |city, index|
      if Country.all.include?(city.country)
        puts "#{index + 1}. #{city.country.name}"
      end
    end
  end
  
  def print_populations
    City.all.each_with_index do |city, index|
      puts "#{index + 1}. #{city.population}"
    end
  end
    
end

