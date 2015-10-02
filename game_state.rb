class GameState
  def initialize(data)
    @data = data
  end

  def [](key)
    @data[key]
  end

  def has_pair?
    my_player["hole_cards"].map { |card| card["rank"] }.uniq.size == 1
  end

  def my_player
    @my_player ||= game_state['players'].select { |player| player['name'] == PLAYER_NAME }.first
  end

  def current_buy_in
    @data['current_buy_in']
  end

  def small_blind
    @data['small_blind']
  end

  def allin
    my_player["stack"]
  end
end