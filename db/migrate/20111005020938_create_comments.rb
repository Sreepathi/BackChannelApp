class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :content
      t.integer :mid

      t.timestamps
    end
  end
end
