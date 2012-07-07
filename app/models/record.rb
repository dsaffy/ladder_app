class Record < ActiveRecord::Base
  belongs_to :user
  has_many :wins
  has_many :losses

  attr_accessible :user, :wins, :losses

  validates_existence_of :user
  validate :wins_and_losses_are_good
  validates_associated :wins, :losses

  def wins_and_losses_are_good
    errors.add(:wins, "less than losses") if wins.count < losses.count
    errors.add(:losses, "less than wins") if losses.count < wins.count
  end

  after_save :updatePlayers

  def updatePlayers
    wins.each do |win|
      losses.each do |loss|
        other_elo = win.entry.elo
        win.entry.updateElo!(1, loss.entry.elo)
        loss.entry.updateElo!(0, other_elo)
      end
    end
  end
end
