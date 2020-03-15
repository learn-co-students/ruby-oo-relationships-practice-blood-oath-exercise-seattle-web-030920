class BloodOath
  attr_accessor :initiation_date, :follower, :cult

  @@all = []

  def initialize(follower, cult)
    @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
    @follower = follower
    @cult = cult
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    oath_sort = self.all.sort_by {|oath| Time.parse(oath.initiation_date)}
    oath_sort[0].follower
  end
end
