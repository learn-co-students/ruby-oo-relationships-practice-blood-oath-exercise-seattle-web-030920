class Cult
    attr_accessor :name, :location, :slogan, :minimum_age
    attr_reader :founding_year

    @@all = []
    
    def initialize(name, location, founding_year, slogan, minimum_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        all.find{|cult| cult.name == cult_name}
    end

    def self.find_by_location(cult_location)
        all.find {|cult| cult.location == cult_location}
    end

    def self.find_by_founding_year(cult_founding_year)
        all.find{|cult| cult.founding_year == cult_founding_year}
    end

    def self.least_popular
        all.reduce(all[0]) {|least_popular, cult| cult.cult_population < least_popular.cult_population ? least_popular = cult : least_popular}
    end

    def self.locations
        all.map {|cult| cult.location}
    end

    def self.most_common_location # this could be better optimized for speed and refactored to look MUCH better
        locations.max_by {|location| locations.count(location)}
    end

    def recruit_follower(follower)
        time = Time.new
        follower.age >= self.minimum_age ? BloodOath.new(self, follower, Date.today) : "Sorry, you are too young to join our cult"
    end

    def blood_oaths
        BloodOath.all.select {|blood_oath| blood_oath.cult == self}
    end

    def followers
        blood_oaths.map {|blood_oath| blood_oath.follower}
    end

    def cult_population
        followers.length
    end

    def average_age
        followers.reduce(0) {|sum, follower| sum + follower.age}.to_f / followers.length.to_f
    end

    def my_followers_mottos
        followers.map {|follower| follower.life_motto}
    end

end
