class Follower    
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name:, age:, life_motto:)
        @name = name    
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        #returns an Array of this follower's cults
        BloodOath.all.select{|blood_oath| blood_oath.follower == self}.map{|blood_oath2| blood_oath2.cult}
    end
    
    def join_cult(cult_name)
        #takes in an argument of a Cult instance and adds this follower to the cult's list of followers        
        if(self.age >= cult_name.minimum_age)
            BloodOath.new(cult: cult_name, follower: self)
        else                        
            puts "Cult \"#{cult_name.name}\" minimum age is #{cult_name.minimum_age}.  Follower #{self.name} is only #{self.age}.  You got #{cult_name.minimum_age - self.age} years before you can rock it out like a champ!"            
        end        
    end

    def my_cults_slogans
        self.cults.map{|cult| cult.slogan}
    end

    def fellow_cult_members        
        self.cults.map{|curr_cult| BloodOath.all.select{|blood_oath_curr| blood_oath_curr.cult == curr_cult}.map{|blood_oath_curr| blood_oath_curr.follower}}.flatten                
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age_to_find)
        #takes an Integer argument that is an age and returns an Array of followers who are the given age or older
        Follower.all.select{|follower| follower.age >= age_to_find}
    end

    def self.most_active
        #returns the Follower instance who has joined the most cults    
        found_max_count = self.all.max{|follower, iter_next| follower.cults.count <=> iter_next.cults.count}        
        followers_with_max = self.all.select{|follower| follower.cults.length == found_max_count.cults.length}        
        #followers_with_max.length == 1 ? followers_with_max[0] : followers_with_max        
        
    end

    def self.top_ten
        #returns an Array of followers; they are the ten most active followers
        self.all.max(10){|follower| follower.cults.length}
    end    

end