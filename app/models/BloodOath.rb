require 'date'

class BloodOath
    attr_reader :cult, :follower

    @@all = []

    def initialize(cult:, follower:)        
        @cult = cult
        @follower = follower
        @initiation_date = DateTime.now
        @@all << self
    end

    #instance area
    def initiation_date
        @initiation_date.to_s
    end

    #class area
    def self.all        
        @@all
    end

    def self.first_oath
        self.all[0].follower
    end

end