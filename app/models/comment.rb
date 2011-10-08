class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :micropost
  belongs_to :user
end
