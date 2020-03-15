require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1=Cult.new("cult 1", "Seattle", 1990, "We are cult 1")
cult2=Cult.new("cult 2", "Paris", 2000, "We are cult 2")
cult3=Cult.new("cult 3", "Paris", 2010, "We are cult 3")

foll1=Follower.new("Tom", 25, "Follower 1")
foll2=Follower.new("Emily", 20, "Follower 2")
foll3=Follower.new("John", 67, "Follower 3")
foll4=Follower.new("Lisa", 18, "Follower 4")

cult1.recruit_follower(foll1)
cult1.recruit_follower(foll2)

foll4.join_cult(cult3)
foll2.join_cult(cult3)

sample_oath=BloodOath.new(foll2, cult2)

Follower.most_active

Cult.most_common_location


puts "Mwahahaha!" # just in case pry is buggy and exits
