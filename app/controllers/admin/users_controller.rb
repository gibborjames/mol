class Admin::UsersController < Admin::BaseController

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "New user created."
			redirect_to admin_users_path
  	else
  		flash[:alert] = "Error on user."
			render :action => 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "Update user."
			redirect_to admin_users_path
  	else
  		flash[:alert] = "Error on Updating user."
			render :action => 'edit'
  	end
  end

  def destroy
  	@user = User.find(params[:id]).destroy
  	flash[:notice] = "Delete user."
		redirect_to admin_users_path
  end

  private
  	def user_params
  		params.require(:user).permit(:email, :password)
  	end
end
