class PlayersController < ApplicationController
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.expect(player: [ :game_id, :name ])
  end
end
