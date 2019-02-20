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
  league2 = League.create!({name:'Danger League'})
  league3 = League.create!({name:'Calabasas League'})
  user1 = User.create!({name: 'Chris', password:'password', email:'chtompkins026@gmail.com', admin: TRUE})
  user2 = User.create!({name: 'Jason Tompkins', password:'password1', email:'chtompkins027@gmail.com', admin: FALSE})
  user3 = User.create!({name: 'Jason Wang', password:'password1', email:'chtompkins0299@gmail.com', admin: FALSE})
  user4 = User.create!({name: 'Jason Lazzaros', password:'password1', email:'chtompkins028@gmail.com', admin: FALSE})
  user5 = User.create!({name: 'Aly Raisman', password:'password1', email:'chtompkins029@gmail.com', admin: FALSE})
  user6 = User.create!({name: 'Blake Lively', password:'password1', email:'chtompkins010@gmail.com', admin: FALSE})
  user7 = User.create!({name: 'Ash Knowles', password:'password1', email:'chtompkins012@gmail.com', admin: FALSE})
  user8 = User.create!({name: 'Reebs Poonawala', password:'password1', email:'chtompkins02777@gmail.com', admin: FALSE})
  user9 = User.create!({name: 'Margot Robbie', password:'password1', email:'chtompkins027333@gmail.com', admin: FALSE})
  user10 = User.create!({name: 'Harvey Spectre', password:'password1', email:'chtompkins027445@gmail.com', admin: FALSE})
  user11 = User.create!({name: 'Jessica Pearson', password:'password1', email:'chtompkins0274453@gmail.com', admin: FALSE})
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
