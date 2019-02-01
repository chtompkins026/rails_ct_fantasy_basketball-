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
  player1 = Player.create!({name:'James Harden', position:'PG', nba_team:'Houston Rockets', points:100})
  player2 = Player.create!({name:'Kemba Walker', position:'SG', nba_team:'Charlotte Hornets', points:49})
  player3 = Player.create!({name:'Taurean Prince', position:'SF', nba_team:'Atlanta Hawks', points:22})
  player4 = Player.create!({name:'Danny Green', position:'SF', nba_team:'Toronto Raptors', points:29})
  player5 = Player.create!({name:'Al Horford', position:'C', nba_team:'Boston Celtics', points:61})
  player6 = Player.create!({name:'Jeff Green', position:'SF', nba_team:'Washington Wizards', points:29})
  player7 = Player.create!({name:'LeBron James', position:'SF', nba_team:'Los Angeles Lakers', points:99})
  player8 = Player.create!({name:'Draymond Green', position:'PF', nba_team:'Golden State Warriors', points:99})
  player9 = Player.create!({name:'Buddy Hield', position:'SG', nba_team:'Sacramento Kings', points:59})
