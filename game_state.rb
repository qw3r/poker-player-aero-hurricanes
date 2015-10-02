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
    @my_player ||= @data['players'][in_action]
  end

  def in_action
    @data['in_action']
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