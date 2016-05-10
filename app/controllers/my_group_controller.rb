class MyGroupController < ApplicationController
def index
	@the_user = working_user[:username]
	@group = Group.where(user_name: @the_user).where(verified_by_user: true)
	@mygroup = MyGroup.where(admin: @the_user)
end

def show
	@projects = AddProject.all
	@group = MyGroup.find_by(id: params[:id])
	@the_user = working_user[:username]
end

def new
	@group = MyGroup.new
end


def create
	@group = MyGroup.new(my_group_param)
	admin_1 = working_user
	@group[:admin] = admin_1[:username]
	if @group.save
  		redirect_to @group
	else
		render 'new'
	end
end

def destroy
  group_in_action = MyGroup.find_by(id: params[:id])
  @groups = AddProject.where(group_name: group_in_action[:groupname])
	@groups.each do |the_group|
  		the_group.destroy
  	end
  @groups = Group.where(groupname: group_in_action[:groupname])
	@groups.each do |the_group|
  		the_group.destroy
  end
  @groups = MyGroup.find_by(groupname: group_in_action[:groupname])
  		@groups.destroy
  redirect_to add_project_index_path 
end

private
def my_group_param
  params.require(:group).permit(:admin, :groupname)
end

end
