# require_relative '../config/environment.rb'
require 'pry'
require_relative '../app/models/cult.rb'
require_relative '../app/models/Follower.rb'
require_relative '../app/models/BloodOath.rb'

# def reload
#   load 'config/environment.rb'
# end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
puts "\n\n**Begin Testing**\n\n"

##Create cults
depress = Cult.new(name: "Depressderados", slogan: "Cheers for tears")
glood_knights = Cult.new(name: "Glood Knights", slogan: "Blood is the seal of our devotion")
orlok_castle = Cult.new(name: "Orlok's Castle", slogan: "Just a few small pricks")
heavens_great = Cult.new(name: "Heaven's Great", slogan: "Who's laughing now?!?!")
jones_frown = Cult.new(name: "Jonesfrown", slogan: "People are just dying to stay")

##create followers
charles = Follower.new(name: "Charles", age: 37, life_motto: "If you're going to do something, do it well. And leave something witchy.")
rosemary = Follower.new(name: "Rosemary", age: 28, life_motto: "Oh, we're fertile, alright.")
marshall = Follower.new(name: "Marshall", age: 65, life_motto: "On a ride to heaven")
orlok = Follower.new(name: "Orlok", age: 46, life_motto: "Try not to hurt yourself... your blood is precious")
jim = Follower.new(name: "Jim", age: 51, life_motto: "To me death is not a fearful thing. It's living that's cursed.")
ron = Follower.new(name: "Ron", age: 74, life_motto: "A cult is only as great as its dreams.")

##create blood_oaths
depress.recruit_follower(charles)
rosemary.join_cult(depress)
glood_knights.recruit_follower(charles)
orlok.join_cult(orlok_castle)
heavens_great.recruit_follower(marshall)
jones_frown.recruit_follower(marshall)
jim.join_cult(jones_frown)
ron.join_cult(depress)
jim.join_cult(depress)

puts "Depress name = #{depress.name} \n slogan = #{depress.slogan}"
puts "#{depress.name} cult has exactly #{depress.cult_population} follower(s)"
puts "#{Cult.find_by_name("Depressderados").name} was found"
puts Follower.of_a_certain_age(50).map{|follower| follower.name}

#$binding.pry
puts "\n**End Testing**\n\n"
puts "Mwahahaha!" # just in case pry is buggy and exits

