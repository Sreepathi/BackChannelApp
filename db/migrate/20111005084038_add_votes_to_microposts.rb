class AddVotesToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :votes, :integer
  end
end
