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

  def blood_oaths
    BloodOath.all.select{|bloodoath|bloodoath.follower == self}
  end

  def cults
    blood_oaths.map{|bloodoath|bloodoath.cult}
  end

  def join_cult(cult)
    self.age >= cult.minimum_age ? BloodOath.new(self, cult) : "You're way too young to be joining a cult!"
  end

  def self.of_a_certain_age(age)
    self.all.select{|follower|follower.age >= age}
  end

  def my_cults_slogans
    self.cults.each{|cult|puts cult.slogan}
  end

  def self.most_active
    self.all.max { |a, b| a.cults.count <=> b.cults.count }
  end

  def self.follower_activity_sort
    follower_activity = self.all.map do |follower|
      {follower => follower.cults.count}
    end
    sorted_follower_activity = follower_activity.sort_by {|follower|follower.values}
    sorted_follower_activity.reverse
  end

  def self.top_ten
    follower_activity_sort[0...9]
  end

  def fellow_cult_members
    all_followers = self.cults.map{|cult|cult.followers}.flatten.uniq
    all_followers.select{|follower|follower != self}
  end
end
