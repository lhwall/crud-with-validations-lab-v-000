class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: %w(true false)}
  validates :release_year, presence: true :if :released?
  validates :release_year, :only_integer: true
  validates :artist_name, presence: true
  validate :not_in_the_future

  def not_in_the_future
    if !!self.release_year
      if self.release_year < Time.new.year
        errors.add(:release_year, "can't be in the future")
      end
    end
end
