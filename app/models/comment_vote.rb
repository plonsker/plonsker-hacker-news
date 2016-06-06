class CommentVote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :comment

  validates :user, uniqueness: {scope: :comment_id}
end
