class CLI 
  
  def scrape
    puts "Loading..."
    City.clear_all
    Country.clear_all
    Scraper.scrape_cities
  end
  
  def await_continue
    puts "press any key to continue..."
    STDIN.getch 
    start
  end
    
  def start
    
    menu
    
    input = gets
    input = input.chomp
    if input == '1'
      print_cities
      await_continue
    elsif input == '2'
      print_urls
      await_continue
    elsif input == '3'
      print_countries
      await_continue
    elsif input == '4'
      print_populations
      await_continue
    elsif input == '5'
      print_countries_with_cities
      await_continue
    elsif input == '6'
      print_city_descriptions
      await_continue
    elsif input == '7'
      exit!
    else
      puts "Try again. Please enter any number from 1 - 7"
      start
    end
  end
    
  def menu
    puts "Welcome to City Scraper for European Cities with > 1,000,000 People"
    puts "Please choose an option from 1 - 7: "
    puts " "
    puts "1. View a list of all high population cities."
    puts "2. View a list of cities with urls."
    puts "3. View a list of cities with their countries."
    puts "4. View a list of cities with populations."
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
      puts "#{index + 1}. #{city.name}:  https://wikipedia.org#{city.url}"
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
      puts " "
      puts "#{index + 1}. #{city.name}:  "
      puts " "
      puts "#{city.description}"
    end
  end
    
end

