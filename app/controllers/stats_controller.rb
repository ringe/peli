class StatsController < ApplicationController
  def weekly_summary
    players = Player.joins(:playthroughs)
                    .merge(Playthrough.weeks_ago(weeks))
                    .group("accounts.id", "accounts.name")
                    .select("accounts.id as id",
                            "accounts.player_id as player_id",
                            "accounts.name as name",
                            "TOTAL(playthroughs.time_spent) as total_duration",
                            "TOTAL(playthroughs.score) as total_score")
                    .order(sort)

    render json: players.to_json
  end

  private

  def sort
    sortable = params.expect(:sort)
    %w[total_duration total_score].include?(sortable) ? sortable : "id"
  end

  def weeks
    params.expect(:weeks_ago).to_i
  end
end
