class RepliesController < ApplicationController
   before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
    # GET /replies/1/edit

   def new
        @title = "replies"
   end


  # POST /replies
  # POST /replies.json
  def create
    @post = Micropost.find_by_id(params[:id])
    #@reply = @post.replies.build.(params[:reply])
     @reply = @post.replies.build(params[:reply])
     #@reply = current_user.reply.build(params[:reply])
    #respond_to do |format|
      if @reply.save
        #format.html { redirect_to @reply, notice: 'Reply was successfully created.' }
        #format.json { render json: @reply, status: :created, location: @reply }
        flash[:success] = "Reply was successfully created!"

      else
        #format.html { render action: "new" }
        #format.json { render json: @reply.errors, status: :unprocessable_entity }
        @feed_items = []
      render 'pages/home'
      end
    #end
     private

    def authorized_user
      @reply = current_user.reply.find_by_id(params[:id])
      redirect_to root_path if @reply.nil?
    end
  end




  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    redirect_back_or root_path



  end
end
