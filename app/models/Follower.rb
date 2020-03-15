class Follower
    attr_accessor :life_motto, :age
    attr_reader :name
    @@all=[]
    def initialize (name, age, life_motto="")
        @name=name
        @age=age
        @life_motto=life_motto
        @@all<<self
    end

    def self.all
        @@all
    end

    def join_cult(cult)
       BloodOath.new(self, cult)
    end

    def cults
        BloodOath.all.map{|oath| oath.cult if oath.follower==self}.compact
    end

    def self.of_a_certain_age(age)
       @@all.select{|follower| follower.age >= age}
    end

    def my_cults_slogans
        cults.map{|cult| cult.slogan}
    end
    
    def self.most_active
        follower_activity_sort[0].keys
    end

    def self.top_ten
        follower_activity_sort.map{|element| element.keys}.slice(0, 10)
    end

    def self.follower_activity_sort
        follower_activity = self.all.map {|follower| {follower => follower.cults.length}}
        sorted_follower_activity = follower_activity.sort_by {|follower| follower.values}
        sorted_follower_activity.reverse
    end

end