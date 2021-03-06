class UsersController < ApplicationController

  # grab the users
  def index
    @users = User.all
    render :index

  end

  def new
      # we need to make
      # a new user
      # to pass to the
      # form later
      @user = User.new
      render :new
    end


  def create
     #@user = User.create(user_params) # calls user_params method
     @user = User.new(user_params)
     if @user.save
       flash[:notice] = "Successfully created user"
       login(@user)
       redirect_to @user
     else
       flash[:error] = @user.errors.full_messages.join(', ')
       redirect_to new_user_path
     end
   end


  def show
      @user = User.find_by_id(params[:id])
      render :show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
