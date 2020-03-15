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
        BloodOath.all.select{|blood_oath| blood_oath.follower == follower}.map{|blood_oath2| blood_oath.cult}
    end
    
    def join_cult(cult_name)
        #takes in an argument of a Cult instance and adds this follower to the cult's list of followers
        BloodOath.new(cult: cult_name, follower: self)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age_to_find)
        #takes an Integer argument that is an age and returns an Array of followers who are the given age or older
        Follower.all.select{|follower| follower.age >= age_to_find}
    end    

end