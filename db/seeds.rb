# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
    email: "james@gmail.com",
    password: "password",
    username: "jfranco",
    f_name: "james",
    l_name: "franco"
  },
  {
    email: "user@gmail.com",
    password: "password",
    username: "dummy",
    f_name: "Dummy",
    l_name: "User"
  }
])

journeys = [
  # journeys for james franco
  users[0].journeys.create([
    {
      title: "This is a big deal",
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
  ])
]

posts = [
  # posts for james franco > "This is a big deal"
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
  # no posts for Dummy User > "Weight Loss"

  # posts for Dummy User > "Transition"
  journeys[1][1].posts.create([
    {
      post_type: "text",
      title: "Let's get started!",
      text: "Selfies Banksy Marfa, High Life hella tattooed plaid pork belly ethical Pinterest Godard meggings you probably haven't heard of them. Locavore fanny pack American Apparel next level Schlitz lomo. Fixie Tumblr you probably haven't heard of them, +1 Wes Anderson fingerstache ethical butcher mixtape Godard 8-bit Banksy skateboard chia. Paleo tofu direct trade, PBR&B photo booth Brooklyn lomo church-key selfies master cleanse raw denim Tumblr. Fap tattooed brunch retro Etsy Austin literally. Meggings biodiesel Brooklyn hashtag. Pop-up swag wolf art party.\nCred ethical chambray fingerstache. Sartorial street art fanny pack, fingerstache photo booth organic small batch single-origin coffee seitan swag next level sriracha pour-over. Disrupt cred master cleanse American Apparel whatever biodiesel synth, shabby chic you probably haven't heard of them banjo roof party put a bird on it actually craft beer. Freegan pour-over selvage, paleo direct trade messenger bag drinking vinegar seitan small batch fashion axe. Master cleanse tousled occupy +1, chillwave biodiesel letterpress fingerstache forage chambray ethical slow-carb roof party hella bitters. Direct trade mustache cornhole asymmetrical fashion axe. Gastropub gluten-free polaroid, meh mixtape street art Odd Future XOXO bespoke art party fap fixie photo booth umami chillwave."
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
