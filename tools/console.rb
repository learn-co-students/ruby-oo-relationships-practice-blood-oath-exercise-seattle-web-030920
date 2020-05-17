require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

jason = Follower.new("Jason", 39, "Cults are awesome!")
jim = Follower.new("Jim", 39, "I want to be a part of a community")
aaron = Follower.new("Aaron", 40, "Not from Detroit")
john = Follower.new("John", 25, "I don't want to join a cult!")

underground_cult = Cult.new("Underground Cult", "Graham", 2011, "Come join our cult!", 18)
huge_cult = Cult.new("Huge Cult", "Seattle", 2001, "We're big so we can't be a cult!", 29)
new_cult = Cult.new("New Cult", "Tacoma", 2019, "We are the new cult on the block!", 12)

underground_cult.recruit_follower(aaron)

huge_cult.recruit_follower(aaron)
huge_cult.recruit_follower(jason)
huge_cult.recruit_follower(jim)

new_cult.recruit_follower(jim)
new_cult.recruit_follower(jason)

oldest_oath = BloodOath.new(huge_cult, john, 2000-05-05)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits