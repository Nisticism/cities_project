

# document.querySelectorAll("tbody")[0].querySelectorAll("td")[1].innerText


class CLI 
  def start 
    puts "Welcome to City Scraper"
    puts "These are the most populous cities in Europe:"
    puts " "
    puts "---------------------------------------------"
    puts " "
    Scraper.scrape_cities
      
      
      
    print_cities
      
  end
    
  def menu
    
  end 
    
    
  def print_cities
    City.all.each_with_index do |city, index|
      puts "#{index + 1}. #{city.name}"
    end
    City.clear_all
  end
    
end

