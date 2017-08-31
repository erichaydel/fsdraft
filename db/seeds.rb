# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

PLAYER_TYPES = {"NHL": "HockeyPlayer",
                "NBA": "BasketballPlayer",
                "MLB": "BaseballPlayer",
                "NFL": "FootballPlayer"
                }.with_indifferent_access

players = CSV.read('db/players.csv')

def split_name(name)
    names = name.split(" ")
    return names[0].strip, names[-1].strip
end

def split_positions(positions)
    return positions.strip.split(",")
end

# Load all the players
idx = 1
last_sport = "NFL"
players.each do |player|
    if last_sport != player[0]
        idx = 1
    end

    puts player[1]

    if player[2] != "DST"
        firstname, lastname = split_name(player[1])
        created = PLAYER_TYPES[player[0]].constantize.create!( firstname: firstname,
                                        lastname: lastname,
                                        position: split_positions(player[2]),
                                        team: player[3],
                                        rank: idx)
    else
        PLAYER_TYPES[player[0]].constantize.create!( firstname: player[1],
                                        lastname: "D/ST",
                                        position: split_positions(player[2]),
                                        team: player[3],
                                        rank: idx)
    end
    last_sport = player[0].to_s.strip
    idx += 1
end

# Rank the positions
PLAYER_TYPES.values.each do |type|
    type.constantize::VALID_POSITIONS.each do |position|
        players = type.constantize.all.order(:rank).select { |p| p.position[0] == position }
        players.each_with_index { |p, idx| p.update(position_rank: idx+1) }
    end
end
