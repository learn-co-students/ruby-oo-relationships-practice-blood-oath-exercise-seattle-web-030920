class Cult

    attr_accessor :name, :location, :founding_year, :slogan, :minimum_age

    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def recruit_follower(follower)
        if follower.age >= @minimum_age
            BloodOath.new(self, follower)
        else
            puts "Sorry, you are too young to join this cult."
        end
    end

    def oaths
        BloodOath.all.select {|oath| oath.cult == self}
    end

    def followers
        self.oaths.map {|oath| oath.follower}
    end

    def cult_population
        self.followers.count
    end

    def average_age
        self.followers.sum {|follower| follower.age} / self.cult_population
    end

    def my_followers_mottos
        self.followers.each {|follower| puts follower.life_motto}
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        @@all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        @@all.select {|cult| cult.founding_year == founding_year}
    end

    def self.least_popular
        @@all.min_by {|cult| cult.cult_population}
    end

    def self.most_common_location
        locations = @@all.map {|cult| cult.location}
        locations.max_by {|cult| locations.count(cult)}
    end

end
