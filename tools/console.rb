require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
#cult initialize(name, location, founding_year, slogan)
#cult recruit_follower(follower)
#follower initialize(name, age, life_motto)
#follower join_cult(cult)
#bloodoat initialize(cult,follower, initiation_date = time.strftime("%Y/%m/%d"))

cult1=Cult.new("cult1", "WA",2008,"Let it rain.",14)
cult2=Cult.new("cult2", "WA",2010,"Let it be cloudy.",10)
cult3=Cult.new("cult3", "CA",2010,"Sunsine.",15)
cult4=Cult.new("cult4", "AZ",2011,"Windy.",3)

follower1 = Follower.new("1Amy", 30, "Always be happy.")
follower2 = Follower.new("2James", 17, "Always be sad.")
follower3 = Follower.new("3Daniel", 45, "Always be good.")
follower4 = Follower.new("4Greoge", 70, "Always be grumpy.")
follower5 = Follower.new("5Jenni", 18, "Five.")
follower6 = Follower.new("6Maggie", 22, "Six.")
follower7 = Follower.new("7Grace", 34, "Seven.")
follower8 = Follower.new("8Jack", 56, "Eight.")
follower9 = Follower.new("9Eve", 67, "Nine.")
follower10 = Follower.new("10John", 27, "Ten.")
follower11= Follower.new("11Ella", 29, "Eleven.")
follower12= Follower.new("12Bob", 38, "Twelve.")
follower13= Follower.new("13Kenny", 24, "Thirteen.")

#cult1: follower3,2,4,1
cult1.recruit_follower(follower3)
cult1.recruit_follower(follower2)
cult1.recruit_follower(follower4)
follower1.join_cult(cult1)

#cult2: 2,1,4
follower2.join_cult(cult2)
follower1.join_cult(cult2)
follower4.join_cult(cult2)

#cult3: 4,1
cult3.recruit_follower(follower4)
cult3.recruit_follower(follower1)
#cult3.recruit_follower(follower3)

follower5.join_cult(cult1)
follower5.join_cult(cult3)
follower5.join_cult(cult2)

# follower6.join_cult(cult1)
# follower6.join_cult(cult3)
# follower6.join_cult(cult2)

# follower7.join_cult(cult1)
# follower7.join_cult(cult3)
# follower7.join_cult(cult2)

# follower8.join_cult(cult1)
# follower8.join_cult(cult3)

# follower9.join_cult(cult2)
# follower9.join_cult(cult1)

# follower10.join_cult(cult3)
# follower10.join_cult(cult2)

# follower11.join_cult(cult1)

# follower12.join_cult(cult3)

# follower13.join_cult(cult4)

#try not to call collect class 
# bo1 = BloodOath.new(cult1,follower3,"2010/01/20")
# bo2 = BloodOath.new(cult1,follower2,"2010/02/20")
# bo3 = BloodOath.new(cult1,follower4,"2010/03/20")
# bo4 = BloodOath.new(cult1,follower1,"2010/04/20")

# bo5 = BloodOath.new(cult2,follower2,"2012/02/02")
# bo6 = BloodOath.new(cult2,follower1,"2012/03/02")
# bo7 = BloodOath.new(cult2,follower4,"2012/04/02")

# bo8 = BloodOath.new(cult3,follower4,"2013/07/15")
# bo9 = BloodOath.new(cult3,follower1,"2013/08/15")
#bo10 = BloodOath.new(cult3,follower3,"2013/09/15")
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits