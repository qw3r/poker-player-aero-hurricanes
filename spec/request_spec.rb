ENV['RACK_ENV'] = 'test'

require_relative '../player_service'
require_relative '../player'
require 'rspec'
require 'rack/test'


describe 'The HelloWorld App' do
  include Rack::Test::Methods

  let(:game_state) {
      <<-JSON
      {
      "players": [
        {
          "name": "#{Player::PLAYER_NAME}",
          "stack": 1000,
          "status": "active",
          "bet": 0,
          "hole_cards": [],
          "version": "Version name 1",
          "id": 0
        },
        {
          "name": "Player 2",
          "stack": 1000,
          "status": "active",
          "bet": 0,
          "hole_cards": [],
          "version": "Version name 2",
          "id": 1
        }
      ],
      "tournament_id": "550d1d68cd7bd10003000003",
      "game_id": "550da1cb2d909006e90004b1",
      "round": 0,
      "bet_index": 0,
      "small_blind": 10,
      "orbits": 0,
      "dealer": 0,
      "community_cards": [],
      "current_buy_in": 0,
      "pot": 0,
      "in_action": 0
    }
    JSON
  }

  def app
    Sinatra::Application
  end



  before :each do
    allow(Logger).to receive(:new).and_return double.as_null_object
  end


  it "" do
    post '/', action: 'bet_request', game_state: game_state

    expect(last_response).to be_ok
    expect(last_response.body).to match /\A\d+\Z/
  end
end