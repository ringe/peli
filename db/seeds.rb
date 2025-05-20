# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Game.create if Game.none?


#player = Player.first # or find/create a specific player
#
#52.times do |i|
#  Playthrough.create!(
#    player_id: player.id,
#    started_at: i.weeks.ago.beginning_of_week + 1.day, # Tuesday each week
#    time_spent: rand(5..60), # minutes
#    score: rand(0..100)
#  )
#end
