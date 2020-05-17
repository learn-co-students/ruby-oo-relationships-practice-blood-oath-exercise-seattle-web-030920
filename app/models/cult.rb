class Cult

    attr_reader :name, :founding_year
    attr_accessor :slogan, :location

    @@all = []

    def initialize(name, founding_year, location, slogan)
        @name = name.to_s
        @founding_year = founding_year.to_i
        @location = location
        @slogan = slogan.to_s
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        Cult.all.find {|cult| cult.name == cult_name}
    end

    def self.find_by_location(cult_location)
        Cult.all.select {|cult| cult.location == cult_location}
    end

    def self.find_by_founding_year(cult_founding_year)
        Cult.all.select {|cult| cult.founding_year == cult_founding_year}
    end

    def recruit_follower(date, follower)
        BloodOath.new(date, follower, self)
    end

    def cult_population
        population = 0
        BloodOath.all.select {|oath| oath.cult == self ? population += 1 : nil}
        population
    end




end
