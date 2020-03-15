require_relative '../config/environment.rb'
require 'date'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

stupid = Cult.new("Stupid", "here, WA", 2019, "poop poop", 0)
newbies = Cult.new("Newbies", "here, WA", 2020, "cuuuuuults!!!", 10)
oldies = Cult.new("Oldies", "there, WA", 2010, "we're old", 40)
exist = Cult.new("Existentials", "nowhere, WA", 0, "beuwqihbweqhufer", -5)

exists = Follower.new("Doesn't Matter", 25, "nothing matters")
old = Follower.new("Old Guy", 95, "my back hurts")
dumb = Follower.new("Dumb Guy", 40, "I don't understand")
young = Follower.new("Young Guy", 11, "just a kid")

first = BloodOath.new(oldies, old, "1980-03-28")
second = BloodOath.new(stupid, dumb)

exist.recruit_follower(exists)
exist.recruit_follower(young)
young.join_cult(newbies)
dumb.join_cult(exist)
dumb.join_cult(oldies)
dumb.join_cult(newbies)

binding.pry
puts "Mwahahaha!" # just in case pry is buggy and exits
