class BloodOath
    attr_accessor :cult, :follower, :date

    @@all = []

    def initialize(cult, follower, date)
        @cult = cult
        @follower = follower
        @date = date
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        all.sort_by {|blood_oath| blood_oath.date}[0].follower
    end

    def initiation_date
        "_#{self.date}_"
    end

end
