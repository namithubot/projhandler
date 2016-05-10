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

private
def user_param
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
end

end
