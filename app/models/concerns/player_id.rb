# Generate nice and short unique Player ID
#
# 6 characters should give about 56 billion possible combinations
class PlayerId
  def self.new
    generated_id = Nanoid.generate(size: 6, alphabet: "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    new if Player.exists?(player_id: generated_id)
    generated_id
  end
end
