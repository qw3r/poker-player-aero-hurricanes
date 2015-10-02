class GameState
  def initialize(data)
    @data = data
  end

  def [](key)
    @data[key]
  end
end