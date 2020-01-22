require 'pry'

def game_hash
    hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => [
                {
                :player_name => "Alan Anderson",
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1
                },
                {
                :player_name => "Reggie Evans",
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7
                },
                {
                :player_name => "Brook Lopez",
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15
                },
                {
                :player_name => "Mason Plumlee",
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 11,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5
                },
                {
                :player_name => "Jason Terry",
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1
                }
            ]
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => [
                {
                :player_name => "Jeff Adrien",
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2
                },
                {
                :player_name => "Bismack Biyombo",
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
                :blocks => 15,
                :slam_dunks => 10
                },
                {
                :player_name => "DeSagna Diop",
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5
                },
                {
                :player_name => "Ben Gordon",
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0 
                },
                {
                :player_name => "Kemba Walker",
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12
                }
            ]
        }
    }
    return hash
end

def num_points_scored(name)
    count = 0
    players =  game_hash[:home][:players] + game_hash[:away][:players] 
    players.each do | player |
      if game_hash[:home][:players][player][:player_name] == name
        return game_hash[:home][:players][player][:points]
    
    while count < 5 do
        if game_hash[:home][:players][count][:player_name] == name
            return game_hash[:home][:players][count][:points]
        elsif game_hash[:away][:players][count][:player_name] == name
            return game_hash[:away][:players][count][:points]
        end
        count += 1
    end
end

def shoe_size(name)
    count = 0
    while count < 5 do
        if game_hash[:home][:players][count][:player_name] == name
            return game_hash[:home][:players][count][:shoe]
        elsif game_hash[:away][:players][count][:player_name] == name
            return game_hash[:away][:players][count][:shoe]
        end
        count += 1
    end
end

def team_colors(team)
    if game_hash[:home][:team_name] == team
        return game_hash[:home][:colors]
    elsif game_hash[:away][:team_name] == team
        return game_hash[:away][:colors]
    end
end

def team_names
    arr = []
    arr.push(game_hash[:home][:team_name])
    arr.push(game_hash[:away][:team_name])
    return arr
end

def player_numbers(team)

    if game_hash[:home][:team_name] == team
        group = :home
    elsif game_hash[:away][:team_name] == team
        group = :away
    end
        
    count = 0
    arr = []
    while count < 5 do
        arr.push(game_hash[group][:players][count][:number])
        count += 1
    end
    return arr.sort
end

def player_stats(name)
    count = 0
    while count < 5 do
        if game_hash[:home][:players][count][:player_name] == name then
            ans = game_hash[:home][:players][count]
            ans.delete(:player_name)
            return ans
        
        elsif game_hash[:away][:players][count][:player_name] == name then
            ans = game_hash[:away][:players][count]
            ans.delete(:player_name)
            return ans
        end
        count += 1
    end
end

def big_shoe_rebounds
    size = 0
    count = 0
    num = 0
    group = :home
    while count < 5 do
        if game_hash[:home][:players][count][:shoe] > size then
            size = game_hash[:home][:players][count][:shoe]
            num = count
        end
        count += 1
    end
    while count < 10 do
        if game_hash[:home][:players][count - 5][:shoe] > size then
            size = game_hash[:home][:players][count][:shoe]
            group = :away
            num = count - 5
           
        end
        count += 1
    end
    return game_hash[group][:players][num][:rebounds]
end

def most_points_scored
    points = 0;
    counter = 0;
    person = 0;
    players =  game_hash[:home][:players] + game_hash[:away][:players] 
    while counter < 10 
      if players[counter][:points] > points
        points =  players[counter][:points]
        person = counter
      end
      counter += 1
    end
    return players[person][:player_name]
end

def winning_team
  ascore = 0
  bscore = 0
  counter = 0
  aplayers = game_hash[:home][:players]
  while counter < 5 
    ascore += aplayers[counter][:points]
    counter += 1
  end
  counter = 0
  bplayers = game_hash[:away][:players]
  while counter < 5 
    bscore += bplayers[counter][:points]
    counter += 1
  end
  return ascore > bscore ? game_hash[:home][:team_name] : game_hash[:away][:team_name] 
end

def player_with_longest_name
  count = 0
  counter = 0
  person = 0
  players = game_hash[:home][:players] + game_hash[:away][:players]
  while counter < 10 
      if players[counter][:player_name].length > count
        count = players[counter][:player_name].length
        person = counter
      end
      counter += 1
  end
  return players[person][:player_name]
end

def long_name_steals_a_ton?
  return true
end