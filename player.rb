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

    case game_state.stage
    when :preflop
      return game_state.allin if game_state.ace_or_king_pair_in_hand?
      return game_state.small_blind * 15 if game_state.q_or_j_pair_in_hand? or (game_state.only_ace_and_king_in_hand? and game_state.suited_in_hand?)
      return game_state.small_blind * 10 if game_state.ten_pair_in_hand? or (game_state.all_high_in_hand? and game_state.suited_in_hand?) or game_state.only_ace_and_king_in_hand?
      return game_state.call_bet if game_state.small_bet? and game_state.all_high_in_hand?
      # > 500
      # if game_state.has_pair_in_hand?
    else
      return game_state.allin if game_state.flush? and game_state.straight?
      return game_state.allin if game_state.straight?
      return game_state.allin if game_state.flush?
      return game_state.allin if game_state.has_more_than_two_of_a_kind?

      return game_state.call_bet if game_state.small_bet?
    end

    0
  rescue Exception => e
    @logger.error "---- ERROR ----"
    @logger.error e.message
    0
  end



  def showdown

  end
end
