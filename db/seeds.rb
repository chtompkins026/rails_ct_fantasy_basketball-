# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  User.destroy_all
  League.destroy_all
  Team.destroy_all
  Player.destroy_all

  league1 = League.create!({name:'Awesome League'})
  user1 = User.create!({name: 'Chris', password:'password', email:'chtompkins026@gmail.com', admin: TRUE})
  team1 = Team.create!({name:'Team Alex', total_points:1120, user:user1, league:league1})
  player1 = Player.create!({name:'James Harden', position:'PG', nba_team:'Houston Rockets', points:100, team:team1})
  player2 = Player.create!({name:'Kemba Walker', position:'SG', nba_team:'Charlotte Hornets', points:49, team:team1})
