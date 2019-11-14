class City 
  
  attr_accessor :name, :url, :population, :country, :description
  
  @@all = []
  
  def initialize(name = "", url = "", country = nil, population = nil)
    @name = name 
    @url = url
    @population = population
    @country = country
    
    @@all << self 
  end
  
  def self.all
    @@all
  end
  
  def self.clear_all
    @@all.clear
  end
  
  def self.find_by_name(city_name)
    @@all.each do |city|
      if city.name == city_name
        return city
      end
    end
    false
  end
  
end
