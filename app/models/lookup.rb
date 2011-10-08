class Lookup < ActiveRecord::Base
  def postss
    @postss ||= find_postss
  end

  def find_postss
     @micropost = Micropost.find(:all, :conditions => conditions, :include => :user)
     @micropost.each do |m|
       m.content
     end
  end

  def keyword_conditions
    ["microposts.content LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end

  def user_conditions
    ["users.name LIKE ?", "%#{username}%"] unless username.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
      methods.grep(/_conditions$/).map { |m| send(m)}.compact
  end

end
