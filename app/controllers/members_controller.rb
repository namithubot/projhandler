class MembersController < ApplicationController
def new
	@group = Group.new
end

def create
	group_searched = params[:groupname]
	@found = MyGroup.find_by(group: group_searched[:groupname])
	if @found != nil
		@group = Group.new(group_param)
		admin_1 = working_user
		@group[:user_name] = admin_1[:username]
		@group[:verified_by_user]=false
		if @group.save
  			redirect_to my_group_index_path
		else
			render 'new'
			return
		end
	else
		flash[:danger] = 'Group Does Not Exist :('
		render 'new'
	end
end

def edit
 @group = Group.find(params[:id])
end

def show
	@isAdmin = false
	group = MyGroup.find(params[:id])
	if working_user[:username] == group[:admin]
		@isAdmin = true
	end
	@waiting = Group.where(:groupname => group[:groupname])
end

def update
  @group = Group.find(params[:id])
  @group.verified_by_user = true
	#ap @group
  if @group.update(group_param)
   	redirect_to add_project_index_path
  else
   render 'edit'
  end
end

def destroy
  @add_project = Group.find(params[:id])
  @add_project.destroy

  redirect_to member_path 
end

private
def group_param
  params.require(:group).permit(:user_name, :groupname)
end

end
