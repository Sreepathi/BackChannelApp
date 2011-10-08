class CommentsController < ApplicationController
     def create

        @post = Micropost.find_by_id(params[:id])
         #micropost_id = :id
        @comment = @post.comments.build(params[:comment])
         @comment.User_name = params[:User_name]
          @post.increment(:weight)
        if @comment.save && @post.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end

     end

     def increment

       @comment = Comment.find(params[:id])
       post = @comment.micropost_id
       @micropost = Micropost.find_by_id(post)
       @micropost.increment(:weight)
       @comment.increment(:C_votes)
       @micropost.save
       @comment.save
       redirect_to root_path

     end

  end