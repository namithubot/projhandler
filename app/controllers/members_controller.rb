class MembersController < ApplicationController
def new
	@group = Group.new
end

def create
	group_searched = params[:group]
	@found = MyGroup.find_by(groupname: group_searched[:groupname])
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
 @group = Group.find_by(:id => params[:id])
 #ap @group
end

def show
	@isAdmin = false
	group = MyGroup.find_by(:id => params[:id])
	if working_user[:username] == group[:admin]
		@isAdmin = true
	end
	@waiting = Group.where(:groupname => group[:groupname])
end

def update
  @group = Group.where(:id => params[:id])
   ap @group
  #@group.verified_by_user = true
	
  if @group.update_all(:verified_by_user => true)
   	redirect_to add_project_index_path
  else
	render 'edit'
  end
end
def destroy
  @member = Group.where(:id => params[:id])
  #ap @member
  @member.delete_all
  redirect_to member_path 
end

private
def group_param
  params.require(:group).permit(:user_name, :groupname)
end

end
