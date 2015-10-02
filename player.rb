require 'logger'


class Player

  VERSION = "Default Ruby folding player"



  def initialize
    @logger = Logger.new $stdout
  end



  def bet_request(game_state)
    @logger.info game_state.inspect

    buy_in = game_state['current_buy_in']
    small_blind = game_state['small_blind']

    if 2 * small_blind <= buy_in
      buy_in
    else
      0
    end
  end



  def showdown(game_state)

  end
end
