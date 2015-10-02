require 'logger'


class Player

  VERSION = "Default Ruby folding player v3 final 2 mod"
  PLAYER_NAME = "Aero Hurricanes"

  attr_reader :game_state



  def initialize(game_state)
    @game_state = game_state
    @logger = Logger.new $stdout
  end



  def bet_request
    @logger.info game_state.inspect

    return game_state.allin if game_state.has_pair_in_hand? or game_state.has_more_than_two_of_a_kind?
    return game_state.current_buy_in if game_state.small_bet? and game_state.has_high_in_hand?
    0
  end



  def showdown

  end
end
