# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  # users[0]
  {
    email: "james@gmail.com",
    password: "password",
    username: "jfranco",
    f_name: "james",
    l_name: "franco"
  },
  # users[1]
  {
    email: "user@gmail.com",
    password: "password",
    username: "dummy",
    f_name: "Dummy",
    l_name: "User"
  },
  # users[2]
  {
    email: "demo@mail.com",
    password: "password",
    username: "demo",
    f_name: "Demo",
    l_name: "Brown"
  },
  # users[3]
  {
    email: "person@hotmail.com",
    password: "password",
    username: "personifyme"
  },
  # users[4]
  {
    email: "yourbuddy@gmail.com",
    password: "password",
    username: "buddyolpal",
  },
])

users[0].follow!(users[1], users[2])
users[1].follow!(users[0], users[1], users[4])
users[2].follow!(users[4], users[1])
users[3].follow!(users[1], users[4], users[2])
users[4].follow!(users[0], users[1], users[2], users[3])


# uncomment below to print follow relationships to the console:
# users.each do |user|
#   puts "#{user.username}: "
#   print "following: "
#   user.following.each do |follow|
#     print "#{follow.username} "
#   end
#   puts
#
#   print "followers: "
#   user.followers.each do |follow|
#     print "#{follow.username} "
#   end
#   puts
# end



journeys = [
  # journeys for james franco
  users[0].journeys.create([
    {
      title: "This is big",
      start_date: Time.now
    }
  ]),
  # journeys for Dummy User
  users[1].journeys.create([
    {
      title: "Weight Loss",
      start_date: Time.new(2014, 4, 10),
      end_date: Time.new(2014, 8, 10)
    },
    {
      title: "Transition",
      start_date: Time.now
    }
  ]),
  # journeys for Demo Brown
  users[2].journeys.create([
    {
      title: "Growing up",
      start_date: Time.new(2014, 6, 10),
      end_date: Time.new(2015, 8, 10)
    }
  ]),

  # journeys for personifyme
  users[3].journeys.create([
    {
      title: "Doin' thangs",
      start_date: Time.new(2014, 6, 20),
      end_date: Time.new(2018, 8, 10)
    },
    {
      title: "More thangs",
      start_date: Time.new(2013, 7, 20),
      end_date: Time.new(2014, 6, 20)
    }
  ]),

  # journeys for personifyme
  users[4].journeys.create([
    {
      title: "Transitioning",
      start_date: Time.new(2013, 7, 24),
      end_date: Time.new(2014, 6, 20)
    }
  ])
]

posts = [
  # posts for james franco > "This is big"
  journeys[0][0].posts.create([
    {
      post_type: "text",
      title: "Let's get started!",
      text: "Selfies Banksy Marfa, High Life hella tattooed plaid pork belly ethical Pinterest Godard meggings you probably haven't heard of them. Locavore fanny pack American Apparel next level Schlitz lomo. Fixie Tumblr you probably haven't heard of them, +1 Wes Anderson fingerstache ethical butcher mixtape Godard 8-bit Banksy skateboard chia. Paleo tofu direct trade, PBR&B photo booth Brooklyn lomo church-key selfies master cleanse raw denim Tumblr. Fap tattooed brunch retro Etsy Austin literally. Meggings biodiesel Brooklyn hashtag. Pop-up swag wolf art party.\nCred ethical chambray fingerstache. Sartorial street art fanny pack, fingerstache photo booth organic small batch single-origin coffee seitan swag next level sriracha pour-over. Disrupt cred master cleanse American Apparel whatever biodiesel synth, shabby chic you probably haven't heard of them banjo roof party put a bird on it actually craft beer. Freegan pour-over selvage, paleo direct trade messenger bag drinking vinegar seitan small batch fashion axe. Master cleanse tousled occupy +1, chillwave biodiesel letterpress fingerstache forage chambray ethical slow-carb roof party hella bitters. Direct trade mustache cornhole asymmetrical fashion axe. Gastropub gluten-free polaroid, meh mixtape street art Odd Future XOXO bespoke art party fap fixie photo booth umami chillwave."
    },
    {
      post_type: "video",
      title: "Hey guys",
      video: "ikkH7PVMceU"
    }
  ]),
  # posts for Dummy User > "Weight Loss"
  journeys[1][0].posts.create([
    {
      post_type: "text",
      title: "Let's get started!",
      #TODO: truncate text on show page until user clicks the post. Shortening seeded text for now.
      text: "Selfies Banksy Marfa,blasf local herba hardorevore fanny pack American Apparel" # next level Schlitz lomo. Fixie Tumblr you probably haven't heard of them, +1 Wes Anderson fingerstache ethical butcher mixtape Godard 8-bit Banksy skateboard chia. Paleo tofu direct trade, PBR&B photo booth Brooklyn lomo church-key selfies master cleanse raw denim Tumblr. Fap tattooed brunch retro Etsy Austin literally. Meggings biodiesel Brooklyn hashtag. Pop-up swag wolf art party.\nCred ethical chambray fingerstache. Sartorial street art fanny pack, fingerstache photo booth organic small batch single-origin coffee seitan swag next level sriracha pour-over. Disrupt cred master cleanse American Apparel whatever biodiesel synth, shabby chic you probably haven't heard of them banjo roof party put a bird on it actually craft beer. Freegan pour-over selvage, paleo direct trade messenger bag drinking vinegar seitan small batch fashion axe. Master cleanse tousled occupy +1, chillwave biodiesel letterpress fingerstache forage chambray ethical slow-carb roof party hella bitters. Direct trade mustache cornhole asymmetrical fashion axe. Gastropub gluten-free polaroid, meh mixtape street art Odd Future XOXO bespoke art party fap fixie photo booth umami chillwave."
    },
    {
      post_type: "video",
      title: "Hey guys",
      video: "ikkH7PVMceU"
    }
  ]),

  # posts for Dummy User > "Transition"
  journeys[1][1].posts.create([
    {
      post_type: "text",
      title: "Let's get started!",
      # TODO: see above. shortening seeded post for now.
      text: "Selfies Banksy Marfa, High Life hella tattooed plaid pork belly ethical" #Pinterest Godard meggings you probably haven't heard of them. Locavore fanny pack American Apparel next level Schlitz lomo. Fixie Tumblr you probably haven't heard of them, +1 Wes Anderson fingerstache ethical butcher mixtape Godard 8-bit Banksy skateboard chia. Paleo tofu direct trade, PBR&B photo booth Brooklyn lomo church-key selfies master cleanse raw denim Tumblr. Fap tattooed brunch retro Etsy Austin literally. Meggings biodiesel Brooklyn hashtag. Pop-up swag wolf art party.\nCred ethical chambray fingerstache. Sartorial street art fanny pack, fingerstache photo booth organic small batch single-origin coffee seitan swag next level sriracha pour-over. Disrupt cred master cleanse American Apparel whatever biodiesel synth, shabby chic you probably haven't heard of them banjo roof party put a bird on it actually craft beer. Freegan pour-over selvage, paleo direct trade messenger bag drinking vinegar seitan small batch fashion axe. Master cleanse tousled occupy +1, chillwave biodiesel letterpress fingerstache forage chambray ethical slow-carb roof party hella bitters. Direct trade mustache cornhole asymmetrical fashion axe. Gastropub gluten-free polaroid, meh mixtape street art Odd Future XOXO bespoke art party fap fixie photo booth umami chillwave."
    },
    {
      post_type: "video",
      title: "swi",
      video: "ikkH7PVMceU",
      caption: "hai!"
    },
    {
      post_type: "video",
      title: "check out my stubble",
      video: "sVQPMCvjmCk"
    },
    {
      post_type: "photo",
      title: "dat face",
      photo: "http://kaihofi.us/img/me_dapper.jpg"
    },
    {
      post_type: "photo",
      title: "arm",
      photo: "http://kaihofi.us/img/zia_arm.jpg",
      caption: "what's the POINT? #seewhatididthere"
    }
  ])
]
