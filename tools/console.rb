require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult_1 = Cult.new("boo", "foo", 1990, "boofoo")
cult_2 = Cult.new("woo", "goo", 1980, "woogoo")

follower_1 = Follower.new("yo", 12, "yo12")
follower_2 = Follower.new("eo", 13, "eo13")

bloodoath_1 = BloodOath.new("1990-12-12")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
