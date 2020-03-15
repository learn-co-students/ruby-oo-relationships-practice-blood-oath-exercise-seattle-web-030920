class BloodOath
    attr_accessor
    attr_reader :initiation_date, :follower, :cult
    @@all=[]
    def initialize (follower, cult)
        @follower=follower
        @initiation_date="#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @cult=cult
        @@all<<self
    end

    def self.all
        @@all
    end

    def self.first_oath
        oath_sorted=@@all.sort_by{|oath| Time.parse(initiation_date)}
        oath_sorted[0].follower
    end

end