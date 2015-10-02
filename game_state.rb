class GameState
  def initialize(data)
    @data = data
  end



  def [](key)
    @data[key]
  end



  def has_pair?
    cards.map { |card| card["rank"] }.uniq.size < cards.size
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



  def cards
    @cards ||= my_player["hole_cards"] + @data["community_cards"]
  end
end