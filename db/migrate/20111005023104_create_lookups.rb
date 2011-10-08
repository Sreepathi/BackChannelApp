class CreateLookups < ActiveRecord::Migration
  def change
    create_table :lookups do |t|
      t.string :keywords
      t.string :username

      t.timestamps
    end
  end
end
