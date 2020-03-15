class Cult

    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
    end

    def recruit_follower(follower)
        BloodOath.new(self, follower)
    end

    def oaths
        BloodOath.all.select{|oath| oath.cult == self}
    end

    def followers
        self.oaths.map{|oath| oath.follower}
    end

    def cult_population
        self.followers.count
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select{|cult| cult.founding_year == founding_year}
    end

end
