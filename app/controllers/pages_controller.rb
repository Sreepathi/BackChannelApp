class PagesController < ApplicationController
  def home
    @title = "Home"


     if signed_in?
      @micropost = Micropost.new
      @reply = Reply.new
      @comment = Comment.new
      #@feed_items = current_user.feed.paginate(:page => params[:page])
      @feed_items = Micropost.all

      #@feed_items = @feed_items.sort_by{|value| value.weight}
      #@feed_items = @feed_items.reverse


      #@feed_items = @posts.sort_by{|value| value.weight }

      #@feed_items = @feed_items.reverse



    end

  end

  def contact
    @title = "Contact"

  end


  def reports
   @votes = Micropost.find(:all,:select => "weight,user_id,id")
 end


end
