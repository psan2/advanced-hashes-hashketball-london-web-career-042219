require 'pry'

# Write your code here!
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def all_players
  all_players = []
  game_hash.map do |team, team_data|
    team_data[:players].map do |player_name, player_data|
      all_players << player_data.merge(name: player_name, team: team_data[:team_name])
    end
  end
  return all_players
end

def all_team_data
  all_team_data = []
  game_hash.map do |team, team_data|
    all_team_data << team_data.reject{ |k, v| k == :players}
  end
  return all_team_data
end

def num_points_scored(player_name)
  target_player = all_players.find { |player| player[:name] == player_name}
  return target_player[:points]
end

def shoe_size(player_name)
  target_player = all_players.find { |player| player[:name] == player_name}
  return target_player[:shoe]
end

def team_colors(team_name)
  target_team = all_team_data.find {|team| team[:team_name]==team_name}
  return target_team[:colors]
end

def team_names
  team_names = []
  all_team_data.select { |team| team_names << team[:team_name]}
  return team_names
end

def player_numbers(team_input)
  return all_players.select { |player| player[:team] == team_input }.map { |player| player[:number]}
end

def player_stats(player_name)
  return all_players.find{ |player| player[:name] == player_name}.reject {|key, value| key == :team || key == :name}
end

def big_shoe_rebounds
  biggest_shoe_player = all_players.max_by { |player| player[:shoe]}
  return biggest_shoe_player[:rebounds]
end