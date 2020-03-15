class Follower

    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def oaths
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def cults
        self.oaths.map {|oath| oath.cult}
    end

    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    def my_cults_slogans
        self.cults.map {|cult| cult.slogan}
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        @@all.select {|follower| follower.age >= age}
    end

    def self.most_active
        @@all.max_by {|follower| follower.cults.count}
    end

    def self.top_ten
        @@all.max_by(10) {|follower| follower.cults.count}
    end

end
