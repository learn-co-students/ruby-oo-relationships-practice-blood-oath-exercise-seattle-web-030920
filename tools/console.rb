require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

f1 = Follower.new("Stan", 20, "YOLO")
f2 = Follower.new("Brigite", 43, "Yarr")
f3 = Follower.new("Balthazar", 66, "Magnets: how do they work?")
c1 = Cult.new("Scientology", '1968-02-01', 'LA', 'All about the benjamins')
c2 = Cult.new("Mars Hill", '1999-10-10', "Seattle", "Buncha nut jobs")
f1.join_cult("2020-03-15", c1)
f2.join_cult("2019-12-25", c1)
f3.join_cult("2010-04-02", c2)
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
