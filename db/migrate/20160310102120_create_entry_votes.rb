class CreateEntryVotes < ActiveRecord::Migration
  def change
    create_table :entry_votes do |t|
      t.references :entry, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
