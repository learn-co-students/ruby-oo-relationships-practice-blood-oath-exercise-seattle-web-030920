class BloodOath

    attr_reader :cult, :follower, :date

    @@all = []

    def initialize(cult, follower, date = Date.today.strftime("%Y-%m-%d"))
        @cult = cult
        @follower = follower
        @date = date
        @@all << self
    end

    def date
        @date
    end

    def self.all
        @@all
    end

    def self.first_oath
        dates = @@all.sort_by {|oath| Date.parse(oath.date)}
        dates[0]
    end

end
