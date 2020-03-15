require 'date'
require 'pry'

class Cult
    attr_accessor :name, :location, :slogan
    attr_accessor :founding_year

    @@all = []

    def initialize(name:, slogan:, location:)
        @name = name                
        @slogan = slogan
        @founding_year = Date.today.year
        @location = location
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

    def followers
        BloodOath.all.select{|blood_oat| blood_oat.cult == self}.map{|blood_oath2| blood_oath2.follower}
    end

    def average_age
        #returns a Float that is the average age of this cult's followers
        (self.followers.map{|follower| follower.age}.reduce{|sum,n| sum + n}.to_f / self.followers.length.to_f)
    end

    def my_followers_mottos
        self.followers.map{|follower| follower.life_motto}        
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

    def self.least_popular
        self.all.reduce{|cur_cult, next_cult| cur_cult.cult_population < next_cult.cult_population ? cur_cult : next_cult}
    end

    def self.most_common_location
        #returns a String that is the location with the most cults
        locations_with_count = self.all.map{|cult| cult.location}.uniq.map{|cur_location| {locationKey: cur_location, countKey: self.all.select{|cur_cult| cur_cult.location == cur_location}.length }}         
        location_with_max_occurance = locations_with_count.max{|curr_item, next_item| curr_item[:countKey] <=> next_item[:countKey]}        
        items_with_max_value = locations_with_count.select{|location_to_count| location_to_count[:countKey] == location_with_max_occurance[:countKey]}        
        items_with_max_value.reduce{|result, next_item| result = "#{result[:locationKey]}, #{next_item[:locationKey]}"}        
    end
end