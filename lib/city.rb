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
    @@all = []
  end
  
  
    
    
    
  
end
