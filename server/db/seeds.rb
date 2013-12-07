# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([
  {
    name: 'themattharris',
    email: 'themattharris@twitter.com'
  },
  {
    name: 'cindyli',
    email: 'cindyli@yahoo-inc.com'
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
    target: 50000.00,
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
