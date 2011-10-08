class Reply < ActiveRecord::Base
  attr_accessible :content
  belongs_to :micropost
  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :uid, :presence => true
  validates :mid, :presence => true

  default_scope :order => 'replies.created_at DESC'

end
