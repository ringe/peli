class PlaythroughsController < ApplicationController
  def create
    player = Player.find_by(player_id: player_param)
    return render json: { error: "Player not found" }, status: :not_found if player.nil?

    @playthrough = player.playthroughs.new(playthrough_params)

    if @playthrough.save
      render json: @playthrough, status: :created, location: player_scores_url
    else
      render json: @playthrough.errors, status: :unprocessable_entity
    end
  end

  private

  def player_param
    params.expect(playthrough: [ :player_id ]).require(:player_id)
  end

  def playthrough_params
    params.expect(playthrough: [ :started_at, :score, :time_spent ])
  end
end
