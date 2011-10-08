class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :content
      t.integer :mid
      t.integer :uid

      t.timestamps
    end
  end
end
