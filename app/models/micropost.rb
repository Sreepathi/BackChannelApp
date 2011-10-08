class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :replies
  has_many :comments, :dependent => :delete_all

   validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  default_scope :order => 'weight desc'





end
