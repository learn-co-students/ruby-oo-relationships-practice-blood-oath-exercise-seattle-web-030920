class Cult
    attr_reader :name, :location, :founding_year, :slogan,:minimum_age
    @@all = []
    def initialize(name, location, founding_year, slogan,minimum_age)
        @name = name
        @location = location 
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def recruit_follower(follower)
        if follower.age >= @minimum_age
        BloodOath.new(self,follower)
        else
            puts "Sorry, you are too young for our cult. Our minium age requirement is #{@minimum_age}. You are welcome to join us in the future."
        end
    end

    def cult_array
        bo = BloodOath.all.select{|bo| bo.cult == self}
    end

    def cult_population
       followers =  cult_array.map{|bo| bo.follower}
       followers.length
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

    def self.find_by_founding_year(year)
        self.all.select{|cult| cult.founding_year == year}
    end
    #Advanced Methods
    def average_age
        #cult_array.map{|cult| sum += cult.follower.age}
        total = cult_array.reduce(0){|sum, cult| sum + cult.follower.age}
         total /cult_array.size.to_f
        #average_age
    end
    def my_followers_mottos
        #cult_array.each{|cult| puts "#{cult.follower.life_motto}\n"}, all objects returned
        cult_array.map{|cult| cult.follower.life_motto}
    end

    def self.least_popular
        #self.all.min{|a,b| a.cult_population <=> b.cult_population}
        self.all.min_by {|cult| cult.follower.length}
    end

    def self.most_common_location
        locations = self.all.map {|cult|cult.location}
       # locations.max_by{|location| locations.count(location)}
        locations.max_by{|location,count| count}
    end



    
end