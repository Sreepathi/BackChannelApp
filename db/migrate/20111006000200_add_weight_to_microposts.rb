class AddWeightToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :weight, :integer
  end
end
