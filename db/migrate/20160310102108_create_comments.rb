class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false

      t.references :user, index: true, null: false
      t.references :entry, index: true, null: false

      t.timestamps null: false
  	end
  end
end
