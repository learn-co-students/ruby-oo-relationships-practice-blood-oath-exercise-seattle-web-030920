class Follower

    attr_reader :name, :age, :life_motto
    @@all = []
    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        bos = BloodOath.all.select {|bo| bo.follower == self}
        bos.map {|bo| bo.cult}
    end

    def join_cult(cult)
        if @age >= cult.minimum_age
        BloodOath.new(cult,self)
        else
        puts "Sorry, you are too young for our cult. Our minium age requirement is #{cult.minimum_age}. You are welcome to join us in the future."
        end
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
       # self.all.map {|follower| follower.age >= age} returns true or false
       self.all.select {|follower| follower.age >= age}
    end

    def my_cults_slogans
        cults.map{|this_cult| this_cult.slogan }
    end

    def self.most_active
        self.all.max_by {|follower| follower.cults.length}
    end

    def self.top_ten
       sorted_followers = self.all.sort_by{|follower| follower.cults.length}
       sorted_followers[-10,10]
    end

    def fellow_cult_members
        Follower.all.select{|follower| follower.cults & self.cults != [] && follower != self} 
        #Follower.all.select do |follower|
         # follower.cults & self.cults != [] && follower != self
          #end
    end
end