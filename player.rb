require 'logger'


class Player

  VERSION = "Default Ruby folding player"
  PLAYER_NAME = 'Aero Hurricanes'
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']


  def initialize
    @logger = Logger.new $stdout
  end



  def bet_request(game_state)
    @logger.info game_state.inspect

    buy_in = game_state['current_buy_in']
    small_blind = game_state['small_blind']
    my_player = game_state['players'].select {|player| player['name'] == PLAYER_NAME }
    @logger.info my_player
    

    if 2 * small_blind >= buy_in
      buy_in
    else
      0
    end
  end



  def showdown(game_state)

  end
end
