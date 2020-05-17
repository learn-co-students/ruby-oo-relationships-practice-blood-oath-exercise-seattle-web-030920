class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(follower_age)
        all.select{|follower| follower.age == follower_age}
    end

    def self.top_ten
        all.sort_by {|follower| follower.cults.length}[0..9]
    end

    def self.most_active
        all.max_by {|follower| follower.cults.length}
    end

    def join_cult(cult)
        time = Time.new
        self.age >= cult.minimum_age ? BloodOath.new(cult, self, Date.today) : "Sorry, you are too young to join our cult"
    end

    def blood_oaths
        BloodOath.all.select {|blood_oath| blood_oath.follower == self}
    end

    def cults
        blood_oaths.map{|blood_oath| blood_oath.cult}
    end

    def my_cults_slogans
        cults.reduce([]) {|slogans, cult| slogans + cult.my_followers_mottos}.uniq
    end

    def fellow_cult_members
        cult_members = cults.reduce([]){|member_array, cult| member_array + cult.followers}.uniq
        cult_members.delete(self)
        cult_members
    end

end
