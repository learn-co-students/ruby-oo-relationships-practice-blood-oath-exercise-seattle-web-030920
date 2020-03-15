class Cult
  attr_accessor :name, :city, :founding_year, :slogan, :follower

  @@all = []

  def initialize(name, city, founding_year, slogan)
    @name = name
    @city = city
    @founding_year = founding_year
    @slogan = slogan
    @follower = []
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower)
    BloodOath.new(follower, self)
  end

  def blood_oaths
    BloodOath.all.select{|bloodoath|bloodoath.cult == self}
  end

  def followers
    blood_oaths.map{|bloodoath|bloodoath.follower}
  end

  def cult_population
    followers.count
  end

  def self.find_by_name(name)
    @@all.find{|cult|cult.name == name}
  end

  def self.find_by_location(location)
    @@all.select{|cult|cult.city == location}
  end

  def self.find_by_founding_year(year)
    @@all.select{|cult|cult.founding_year == year}
  end
end
