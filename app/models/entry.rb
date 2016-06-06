class Entry < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  # has_one :submission_link

  has_many :comments
  has_many :entry_votes

  validates :title, :submission_link, :user, presence: true

  def original_author?(user)
  	self.user == user
  end

  def vote_count
    self.entry_votes.count
  end

end
