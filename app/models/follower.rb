class Follower

    attr_accessor :name, :motto
    attr_reader :age

    @@all = []

    def initialize(name = name.to_s, age = age.to_i, life_motto = life_motto.to_s)
        @name = name
        @age = age
        @motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        @@all.select {|follower| follower.age >= age}
    end

    def join_cult(date, cult)
        BloodOath.new(date, self, cult)
    end

    def cults
        BloodOath.all.map {|oath| oath.follower == self ? oath.cult : nil}.compact
    end

end