class EntryVote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :entry

  #multiple column validation
  validates :user, uniqueness: {scope: :entry_id}
end
