class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :ladder
  has_many :wins
  has_many :losses

  attr_accessible :user, :elo, :ladder

  validates_existence_of :user
  validates_existence_of :ladder

  def chanceToWin other_elo
    1.0 / ( 1.0 + 10.0 ** ((other_elo - self.elo) / 400.0) )
  end

  # win is 1 for a win, 0.5 for a tie, 0 for a loss
  def updateElo!(win, other_elo)
    self.elo += ladder.kvalue * (win - chanceToWin(other_elo))
    save
  end
end
