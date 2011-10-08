class AddUidVotesToComments < ActiveRecord::Migration
  def change
    add_column :comments, :User_name, :string
    add_column :comments, :C_votes, :integer
  end
end
