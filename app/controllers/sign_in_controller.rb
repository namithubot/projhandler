class SignInController < ApplicationController
  def index
  end

  def new
	if logged_in?
		redirect_to add_project_index_path
	end
  end

  def create
	current_user= UserDetail.find_by(username: params[:sign_in_user][:username])
		if current_user && current_user.authenticate(params[:sign_in_user][:password])
			ap current_user
			log_in current_user
			redirect_to add_project_index_path
		else
			flash[:danger] = 'Invalid credentials'
			render 'new'
		end	
	else
  end

def edit
 @user = UserDetail.new
 @user.username = working_user[:username]
end

def update
  ap params
  @user = UserDetail.find_by(username: working_user[:username])
	#ap @group
  	if @user.update(user_param)
   		redirect_to add_project_index_path
  	else
   		render 'edit'
  	end
end

  def destroy
	log_out
	redirect_to root_url
  end

private
def user_param
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
end
end
