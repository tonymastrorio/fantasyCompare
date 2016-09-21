require 'httparty'
require 'pry'


class NFLJSON
  attr_accessor :position, :week, :players


  #take a url with variables to get proper JSON data
  def self.url(position, week)
    @url =  "http://api.fantasy.nfl.com/v1/players/stats?statType=weekProjectedStats&season=2016&week=#{week}&position=#{position}&format=json&returnHTML=1"
  end

# Takes input to parse proper JSON Position data by returing proper url link
def self.inputs
  positions = ["QB","RB","WR","TE","K","DEF"]
  puts "Please pick a position (1-6) \n1.QB\n2.RB\n3.WR\n4.Te\n5.K\n6.DEF"
  pos_input = gets.chomp
  pos_input = pos_input.to_i-1
  if !pos_input.between?(0,5)
    puts "Invalid Input"
    inputs
  else
    @position = positions[pos_input]
  end
    puts "Please select a week for stats"
    @week = gets.chomp
  self.url(@position, @week)
  self.players(@url)
end

#generates simplefied list of parsed down data from API
def self.players(url)
  ###move out
  response = HTTParty.get(url)
  test = response.parsed_response
  @players = []
  test["players"].each do |key, value|
    weekProjectedPts = key["weekProjectedPts"]
    name = key["name"]
    playerId = key["id"]
    @players << {name: name, weekProjectedPts: weekProjectedPts, playerId: playerId}
  end
  @players
end

  #take the parsed players hash array, sorts it and returns the top 10 projected players
 def self.top_ten_list(players)
   @top_ten = []
   @top_ten << players.sort_by {|key| key[:weekProjectedPts]}.reverse!.first(10)

 end

  binding.pry
end
