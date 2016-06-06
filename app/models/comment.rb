class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :entry

  has_many :comment_votes

  validates :content, :user, :entry,presence: true
end
