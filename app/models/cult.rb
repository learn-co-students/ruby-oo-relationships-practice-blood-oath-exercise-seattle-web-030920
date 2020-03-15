require 'date'

class Cult
    attr_accessor :name, :location, :slogan
    attr_accessor :founding_year

    @@all = []

    def initialize(name:, slogan:)
        @name = name                
        @slogan = slogan
        @founding_year = Date.today.year
        @@all << self
    end

    def recruit_follower(follower)
        #add to list of cult followers
        BloodOath.new(cult: self, follower: follower)    
    end

    def cult_population
        #returns an Integer that is the number of followers in this cult
        BloodOath.all.select{|blood_oat| blood_oat.cult == self}.length                
    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        #takes a String argument that is a name and returns a Cult instance whose name matches that argument
        self.all.find{|cult| cult.name == cult_name}
    end

    def self.find_by_location(cult_location)
        #takes a String argument that is a location and returns an Array of cults that are in that location
        self.all.find{|cult| cult.location == cult_location}
    end

    def self.find_by_founding_year(cult_founding_year)
        #takes an Integer argument that is a year and returns all of the cults founded in that year
        self.all.select{|cult| cult.founding_year == cult_founding_year}
    end



end