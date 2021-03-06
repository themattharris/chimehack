# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([
  {
    name: 'Allison L',
    email: 'allison@me.com'
  },
  {
    name: 'themattharris',
    email: 'themattharris@myemail.net'
  },
  {
    name: 'cindyli',
    email: 'cindyli@ymyemail.net'
  },
  {
    name: 'Pinky Parker',
    email: 'parker@myemail.net'
  },
  {
    name: 'markp',
    email: 'markymark@myeail.net'
  },
  {
    name: 'madninja',
    email: 'madninja@myemail.net'
  },
  {
    name: 'jouhan',
    email: 'jouhan@myemail.net'
  },
  {
    name: 'greentea',
    email: 'greentea@myemail.net'
  },
  {
    name: 'coffeeandtv',
    email: 'coffeeandtv@myemail.net'
  }
])

teams = Team.create([
  {
    name: 'chimehackers',
    creator: users.first
  },
  {
    name: 'hackchimers',
    creator: users.last
  }
])

teams.first.users << users
teams.last.users << users.first

challenges = Challenge.create([
  {
    name: 'chimehack',
    description: '#chimehack event, December 5-7, 2013',
    target: 500.00,
    currency: 'USD',
    current: 0.00,
    target_date: '2013-12-07',
    creator: users.first,
    team: teams.first
  },
  {
    name: 'candycrush',
    description: 'the great swap your candy for monday challenge',
    target: 1000.00,
    currency: 'USD',
    current: 10.00,
    target_date: '2013-12-07',
    creator: users.last,
    team: teams.first
  }
])

donations = Donation.create([
  {
    challenge: challenges[1],
    donor: users[1],
    referrer: users.first,
    value: 15.00
  },
  {
    challenge: challenges[1],
    donor: users[2],
    referrer: users.first,
    value: 15.00
  },
  {
    challenge: challenges[1],
    donor: users[3],
    referrer: users.first,
    value: 25.00
  },
  {
    challenge: challenges[1],
    donor: users[4],
    referrer: users.first,
    value: 50.00
  },
  {
    challenge: challenges[1],
    donor: users[5],
    referrer: users.first,
    value: 5.00
  },
  {
    challenge: challenges[1],
    donor: users[6],
    referrer: users.first,
    value: 15.00
  },
  {
    challenge: challenges[1],
    donor: users[7],
    referrer: users.first,
    value: 50.00
  },
  {
    challenge: challenges[1],
    donor: users[8],
    referrer: users.first,
    value: 25.00
  }
])

incentives = Incentive.create([
  {
    value: 1,
    description: "Protein biscuits for a hungry child."
  },
  {
    value: 6,
    description: "A soccer ball for children in refugee camps."
  },
  {
    value: 20,
    description: "Bed nets to protect families from deadly malaria-carrying mosquitoes."
  },
  {
    value: 35,
    description: "Vaccines to protect 50 kids from killer diseases."
  },
  {
    value: 70,
    description: "High-protein peanut paste to protect kids from malnutrition."
  },
  {
    value: 100,
    description: "A bicycle to deliver medicines."
  },
  {
    value: 240,
    description: "A School-in-a-Box kit that lets kids learn anywhere."
  },
  {
    value: 500,
    description: "A pump that provides clean water to a village or school."
  },
  {
    value: 2800,
    description: "A motorbike ambulance that travels easily."
  }
])