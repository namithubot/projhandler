class HomeController < ApplicationController


def index
    
end

 def new
     @user = UserDetail.new
 end

def create
    @user = UserDetail.new(user_param)
    if @user.save
        redirect_to login_path, notice => "signed up!"
    else
        render 'new'
    end
end

def edit
	@user = UserDetail.new
end

def update
@user = UserDetail.find_by(username: params[:user])

  if @user.email == params[:email]
    respond_to do |format|
        PasswordRecoveryMailer.recover_my_password(@user).deliver_now
 
        format.html { redirect_to(@user, notice: 'Password sent to the Email') }
        format.json { render json: @user, status: :created, location: @user }
     end
   else
		flash[:danger] = 'Invalid credentials'
			render 'edit'	
   end
end

private
def user_param
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
end

end
