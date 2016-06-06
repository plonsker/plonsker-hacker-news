class CreateCommentVotes < ActiveRecord::Migration
  def change
  	create_table :comment_votes do |t|
      t.references :comment, null: false
      t.references :user, null: false

      t.timestamps null: false
  end
  end
end
