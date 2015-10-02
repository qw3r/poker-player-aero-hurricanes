require 'logger'


class Player

  VERSION = "Default Ruby folding player"
  PLAYER_NAME = 'Aero Hurricanes'
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_reader :my_player, :game_state



  def initialize(game_state)
    @game_state = game_state
    @logger = Logger.new $stdout
  end



  def bet_request
    @logger.info game_state.inspect

    buy_in = game_state['current_buy_in']
    small_blind = game_state['small_blind']
    @my_player = game_state['players'].select { |player| player['name'] == PLAYER_NAME }.first

    return allin if has_pair?
    return buy_in if (2 * small_blind >= buy_in)
    0
  end



  def has_pair?
    @my_player["hole_cards"].map { |card| card["rank"] }.uniq.size == 1
  end



  def allin
    @my_player["stack"]
  end



  def showdown

  end
end
