class Country 
  
  attr_accessor :name, :cities
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @cities = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_city(city)
    @cities << city
  end
  
  def self.clear_all
    @@all.clear
  end
  
end