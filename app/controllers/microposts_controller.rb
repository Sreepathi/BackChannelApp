class MicropostsController < ApplicationController
 before_filter :authenticate, :only => [:create, :destroy]
 before_filter :authorized_user, :only => :destroy

 def new
   @title = "microposts"
 end

  def create
    @micropost  = current_user.microposts.build(params[:micropost])

    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def increment
    @micropost = Micropost.find(params[:id])
    @user_id = @micropost.user_id
    vote = Vote.find(:first, :conditions => {:user_id => @micropost.user_id, :micropost_id => @micropost.id})

    if vote or @micropost.user_id == current_user.id
           flash[:failure] = "You cannot vote now"
    else
       @micropost.increment(:votes)
       @micropost.increment(:weight)
       @micropost.save
       @votes = Vote.new
       @votes.micropost_id = @micropost.id
       @votes.user_id = @micropost.user_id
       @votes.save

    end
        redirect_to root_path



  end

  def destroy
    #@micropost.destroy
    Micropost.find(params[:id]).destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end

