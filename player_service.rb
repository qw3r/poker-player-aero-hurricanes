require 'sinatra'
require 'json'
require_relative 'player'
require_relative 'game_state'

set :port, 8090
set :bind, '0.0.0.0'

post "/" do
  if params[:action] == 'bet_request'
    state = GameState.new(JSON.parse(params[:game_state]))

    Player.new(state).bet_request.to_s
  elsif params[:action] == 'showdown'
    state = GameState.new(JSON.parse(params[:game_state]))

    Player.new(state).showdown
    'OK'
  elsif params[:action] == 'version'
    Player::VERSION
  else
    'OK'
  end
end
