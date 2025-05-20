class StatsController < ApplicationController
  def weekly_summary
    players = Player.joins(:playthroughs)
                    .merge(Playthrough.weeks_ago(weeks))
                    .select(:id, :player_id, :name,
                            "TOTAL(playthroughs.time_spent) as total_duration",
                            "TOTAL(playthroughs.score) as total_score")
                    .group("accounts.id")
                    .order(sort)

    render json: players.to_json
  end

  def impact_report
    first_score = "(SELECT score FROM playthroughs p2 WHERE p2.player_id = accounts.id ORDER BY started_at ASC LIMIT 1)"
    highest_score = "MAX(playthroughs.score)"

    players = Player
      .joins(:playthroughs)
      .select(:id, :player_id, :name,
        "#{first_score} AS first_score",
        "#{highest_score} AS highest_score",
        "(#{highest_score} - #{first_score}) AS impact"
      )
      .group("accounts.id")
      .order("impact desc")

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
