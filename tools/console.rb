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

##Create cults - manual effort
depress = Cult.new(name: "Depressderados", slogan: "Cheers for tears", location: "New York NY")
glood_knights = Cult.new(name: "Glood Knights", slogan: "Blood is the seal of our devotion", location: "New York NY")
orlok_castle = Cult.new(name: "Orlok's Castle", slogan: "Just a few small pricks", location: "Oravský Podzámok Slovakia")
heavens_great = Cult.new(name: "Heaven's Great", slogan: "Who's laughing now?!?!", location: "San Diego CA")
jones_frown = Cult.new(name: "Jonesfrown", slogan: "People are just dying to stay", location: "San Diego, CA")#Jonestown, Guyana")

##create followers - manual effort
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
#jim.join_cult(heavens_great)

##Random followers - automated effort
  puts "\nCreating some random followers"
  File.open("tools/followerData.txt").each{|line| Follower.new(name: line.split[0], age: rand(10...100), life_motto: "#{line.split[0]}'s - motto")}    
##Random cults - automated effort
  puts "\nCreating some random cults"
  File.open("tools/cultData.txt").each{|line| Cult.new(name: line.split(',')[0], slogan: line.split(',')[1], location: line.split(',')[2])}  
##Automated blood oaths  
#Follower.all.length.times{|index| Follower.all[index].join_cult(Cult.all[(rand(0...Cult.all.length))])}  
puts "\nCreating some random BloodOaths from the random followers and cults"
Cult.all.each{|cult| index = rand(0...Follower.all.length-5); 5.times{|iter| cult.recruit_follower(Follower.all[index+iter])}}

puts "\n\n*** Cult#slogan"
puts "Depress name = #{depress.name} \n slogan = #{depress.slogan}"

puts "\n\n*** Cult#cult_population"
puts "#{depress.name} cult has exactly #{depress.cult_population} follower(s)"

puts "\n\n*** Cult.find_by_name"
puts "#{Cult.find_by_name("Depressderados").name} was found"

puts "\n\n*** Follower.of_a_certain_age"
puts Follower.of_a_certain_age(98).map{|follower| "#{follower.name} at #{follower.age}"}

##Advanced Methods - Analytics!
#Average age  #37, 28, 74, 51 = 47.5
puts "\n\n*** Cult#average_age"
puts "The average age of the #{depress.name} cult = #{depress.average_age.round(2)}"

#Cult followers' my_followers_mottos
puts "\n\n*** Cult#my_followers_mottos"
puts "The following mottos are for the #{depress.name} cult \n #{depress.my_followers_mottos}"

#Least popular cult
puts "\n\n*** Cult.least_popular"
puts "The least popular cult is #{Cult.least_popular.name} with #{Cult.least_popular.cult_population} devotees! Living up to the definition of cult!."

#Most common location
puts "\n\n*** Cult.most_common_location"
puts Cult.most_common_location

#my_cults_slogans
puts "\n\n*** Follower#my_cults_slogans"
jims_cult_slogans = jim.my_cults_slogans.reduce{|result, next_iter| "#{result}, #{next_iter}"}
puts "#{jim.name}'s cult slogans are #{jims_cult_slogans}"
charles_cult_slogans = charles.my_cults_slogans.reduce{|result, next_iter| "#{result}, #{next_iter}"}
puts "#{charles.name}'s cult slogans are #{charles_cult_slogans}"

#most_active
puts "\n\n*** Follower#most_active"
puts "The follower(s) following the most cults are #{Follower.most_active.map{|follower| follower.name}} who signed with #{Follower.most_active[0].cults.length} cults.  They are killing it!"

#.top_ten
puts "\n\n*** Follower.top_ten"
top_ten_result = Follower.top_ten.map{|follower| follower.name}.reduce{|result, next_follower| result = "#{result}, #{next_follower}"}
puts "The top ten followers are #{top_ten_result}"

#.first_oath
puts "\n\n*** BloodOath.first_oath"
puts "The follower who made the fist blood oath is #{BloodOath.first_oath.name}"

#fellow_cult_members
puts "\n\n*** Follower#.fellow_cult_members"
puts "Followers in the same cults as #{jim.name} are #{jim.fellow_cult_members.map{|follower| follower.name}}"
young_follower = Follower.new(name: "Ron", age: 10, life_motto: "A cult is only as great as its dreams.")

#join_cult with a person that is too young
puts "\n\n*** Follower#join_cult with a user younger than min age"
young_follower.join_cult(depress)


#$binding.pry
puts "\n**End Testing**\n\n"
puts "Mwahahaha!" # just in case pry is buggy and exits

