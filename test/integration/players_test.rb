require "test_helper"

class PlayersTest < ActionDispatch::IntegrationTest
  fixtures :games

  test "creates a player" do
    game = games(:one)

    payload = {
      player: {
        game_id: game.id,
        name: "King"
      }
    }

    post "/players", params: payload.to_json, headers: { "Content-Type" => "application/json" }

    assert_response :created

    json = JSON.parse(response.body)
    assert_equal "King", json["name"]
    assert_equal game.id, json["game_id"]
    assert json["player_id"]
  end
end
