class CreateEntries < ActiveRecord::Migration
  def change
  	create_table :entries do |t|
      t.string :title, null: false
      t.string :submission_link, null: false

      t.references :user, null: false

      t.timestamps null: false

  	end
  end
end
