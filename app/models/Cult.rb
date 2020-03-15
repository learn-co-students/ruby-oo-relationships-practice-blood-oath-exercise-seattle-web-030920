class Cult
    attr_accessor :location, :slogan
    attr_reader :name, :founding_year
    @@all=[]
    def initialize (name, location, founding_year, slogan="")
        @name=name
        @location=location
        @founding_year=founding_year
        @slogan=slogan
        @@all<<self
    end

    def self.all
        @@all
    end

    def recruit_follower (follower)
        BloodOath.new(follower, self)
    end

    def my_followers
        BloodOath.all.map{|oath| oath.follower if oath.cult==self}.compact
    end

    def cult_population
        BloodOath.all.select{|oath| oath.cult == self}.length
    end

    def self.find_by_name(name)
        @@all.find{|cult| cult.name == name}
    end
    
    def self.find_by_location(location)
        @@all.find{|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        @@all.find{|cult| cult.founding_year == year}
    end

    def average_age
        age_array=my_followers.map{|follower| follower.age}
        age_array.sum / age_array.size.to_f
    end

    def my_followers_mottos
     my_followers.map{|follower| follower.life_motto}
    end


    def self.cult_activity_sort
        cult_activity = self.all.map {|cult| {cult=> cult.my_followers.length}}
        sorted_cult_activity = cult_activity.sort_by {|cult| cult.values[0]}
    end

    def self.least_popular
        cult_activity_sort[0]
    end

    def self.locations_array
        locations={}
        self.all.each do |cult|
            if !locations[cult.location]
                locations[cult.location]=1
            else
                locations[cult.location]+=1
            end
        end
        locations
    end

    def self.most_common_location
       loc=locations_array.max_by{|location, count| count}
       loc[0] 
       binding.pry
    end

end