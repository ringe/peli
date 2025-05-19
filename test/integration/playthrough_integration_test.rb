require "test_helper"

class PlaythroughIntegrationTest < ActionDispatch::IntegrationTest
  fixtures :players

  test "creates a playthrough" do
    player = players(:one)

    payload = {
      playthrough: {
        player_id: player.player_id,
        started_at: 22.minutes.ago,
        score: 8,
        duration: 22.minutes.to_i
      }
    }

    post "/players/#{player.player_id}/scores", params: payload.to_json, headers: { "Content-Type" => "application/json" }

    assert_response :created
  end
end
