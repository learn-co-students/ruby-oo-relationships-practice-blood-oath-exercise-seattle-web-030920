class Cult
  attr_accessor :name, :city, :founding_year, :slogan, :follower, :minimum_age

  @@all = []

  def initialize(name, city, founding_year, slogan, minimum_age)
    @name = name
    @city = city
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age
    @follower = []
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower)
    follower.age >= minimum_age ? BloodOath.new(follower, self) : "They're way too young to be joining a cult!"
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

  def average_age
    all_age = 0
    self.followers.map{|follower|all_age += follower.age}
    all_age / self.cult_population
  end

  def my_followers_motto
    self.followers.each{|follower| puts follower.life_motto}
  end

  def self.least_popular
    BloodOath.all.min { |a, b| a.cult.cult_population <=> b.cult.cult_population }
  end

  def self.most_common_location
    locations = self.all.map{|cult|cult.city}
    locations.max_by{|i|locations.count(i)}
  end
end
