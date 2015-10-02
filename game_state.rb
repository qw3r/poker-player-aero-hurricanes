class GameState
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(data)
    @data = data
  end



  def [](key)
    @data[key]
  end



  def has_pair_in_hand?
    my_cards.map { |card| card["rank"] }.uniq.size == 1
  end



  def has_more_than_two_of_a_kind?
    cards.size - cards.map { |card| card["rank"] }.uniq.size > 1
  end



  def has_high_in_hand?
    my_cards.any? { |card| ['J', 'Q', 'K', 'A'].include? card["rank"] }
  end



  def has_pair_with_hand?
    #cards.size - cards.map { |card| card["rank"] }.uniq.size > 1
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



  def my_cards
    my_player["hole_cards"]
  end



  def cards
    my_cards + community_cards
  end



  def community_cards
    @data["community_cards"]
  end



  def stage
    case community_cards.size
    when 0
      :preflop
    when 3
      :flop
    when 4
      :turn
    else
      :river
    end
  end



  def small_bet?
    2 * small_blind >= current_buy_in
  end
end