class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy, :createadmin]
  # GET /users
  # GET /users.json
  def index
    @title = "All users"

    @users = User.paginate(:page => params[:page])
    #@users = User.paginate

    #.paginate(:page => params[:page])

    #respond_to do |format|
     # format.html # index.html.erb
      #format.json { render json: @users }
    #end
  end

  # GET /users/1
  # GET /users/1.json
  def show


    @user = User.find(params[:id])
     #@user = User.find(:all)
     #@user.each do |p|
        #p.microposts = @user.microposts

        #@microposts = p.microposts
       #@microposts = @user.microposts.paginate(:page => params[:page])
      @microposts = @user.microposts

    @title = @user.name
    #format.html { redirect_to root_path }

  end

  # GET /users/new
  # GET /users/new.json
  def new
     @title = "Sign up"
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    #@user = User.find(params[:id])
    @title = "Edit user"
  end

  # POST /users
  # POST /users.json
  def create
      @user = User.new(params[:user])

      respond_to do |format|
        if @user.save
             if current_user!=nil && current_user.admin?
                 format.html { redirect_to root_path, notice: 'You have successfully created a user.' }


          else
            sign_in @user

            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render json: @user, status: :created, location: @user }
          end
          #flash[:success] = "Welcome to the Sample App!"
          #redirect_to @user
        else
           @title = "Sign up"

           if current_user!=nil && current_user.admin?
                 format.html { render action: "createadmin" }
           else
                 format.html { render action: "new" }
           end

          format.json { render json: @user.errors, status: :unprocessable_entity }
          # @title = "Sign up"
          #render 'new'
        end
      end
    end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    #respond_to do |format|
      if @user.update_attributes(params[:user])
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { head :ok }
        flash[:success] = "Profile updated."
        redirect_to @user
      else
        #format.html { render action: "edit" }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
        @title = "Edit user"
        render 'edit'
      end
    #end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #@user = User.find(params[:id])
    #@user.destroy

    #respond_to do |format|
     # format.html { redirect_to users_url }
      #format.json { head :ok }
    #end

    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path

  end

  private



   def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
   end

  def admin_user
      redirect_to(root_path) unless current_user.admin?

  end
end
