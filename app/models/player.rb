class Player < Account
  belongs_to :game
  has_many :playthroughs

  validates_presence_of :name, :player_id
  validates_uniqueness_of :player_id

  before_validation :set_player_id

  private

  def set_player_id
    self.player_id ||= PlayerId.new
  end
end
