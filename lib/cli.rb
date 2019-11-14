

# document.querySelectorAll("tbody")[0].querySelectorAll("td")[1].innerText


class CLI 
  
  def scrape
    City.clear_all
    Country.clear_all
    Scraper.scrape_cities
  end
    
  def start
    
    menu
    
    input = gets
    if input == /[0-9]/
      input = input.to_i
    end
    if input == 1
      print_cities
      puts "press any key to continue..."
      STDIN.getch 
      start
    elsif input == 2 
      print_urls
    elsif input == 3
      print_countries
    elsif input == 4
      print_populations
    elsif input == 5
      print_countries_with_cities
    elsif input == 6
      print_city_descriptions
    elsif input == 7
      exit!
    else
      puts "Try again. Please enter any number from 1 - 7"
      start
    end
  end
    
  def menu
    puts "Welcome to City Scraper for High Population (Over 1,000,000 People) European Cities"
    puts "Please choose an option from 1 - 7: "
    puts " "
    puts "1. View a list of all high population cities."
    puts "2. View list with urls."
    puts "3. View list with countries."
    puts "4. View list with populations."
    puts "5. View a list of all countries with their cities."
    puts "6. View cities with their descriptions."
    puts "7. Exit program"
  end 
    
    
  def print_cities
    City.all.each_with_index do |city, index|
      puts "#{index + 1}. #{city.name}"
    end
  end
  
  def print_urls
    City.all.each_with_index do |city, index|
      puts "#{index + 1}. #{city.name}:  https://wikipedia.org/#{city.url}"
    end
  end
  
  def print_countries
    City.all.each_with_index do |city, index|
      if Country.all.include?(city.country)
        puts "#{index + 1}. #{city.name}:  #{city.country.name}"
      end
    end
  end
  
  def print_populations
    City.all.each_with_index do |city, index|
      puts "#{index + 1}. #{city.name}:  #{city.population}"
    end
  end
  
  def print_countries_with_cities
    Country.all.each_with_index do |country, index|
      puts "#{index + 1}. #{country.name}:"
      country.cities.each do |city|
        puts "#{city.name}"
      end
    end
  end
  
  def print_city_descriptions
    City.all.each_with_index do |city, index|
      puts "#{index + 1}. #{city.name}:  "
      puts " "
      puts "#{city.description}"
    end
  end
    
end

