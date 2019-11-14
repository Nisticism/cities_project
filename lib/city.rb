class City 
  
  attr_accessor :name, :url, :population, :country
  
  @@all = []
  
  def initialize(name, url, population = nil, country = nil)
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
  
  
    
    
    
  
end
