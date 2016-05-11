class AddProjectController < ApplicationController
 def index
  @add_proj = AddProject.all
  @admin_1 = working_user[:username]
  @status_proj
 end
 def new
  @add_project = AddProject.new
 end
  
 def explore
   @add_proj = AddProject.all
 end

 def edit
 #confirm "Are you sure?"
  @add_project = AddProject.find(params[:id])
  
 end
 
 def show
  @add_proj = AddProject.find(params[:id])
  @admin_1 = working_user[:username]
 end

 def create
  @add_project = AddProject.new(add_project_param)
	admin_1 = working_user
	@add_project[:admin] = admin_1[:username]
	if @add_project.save
  		redirect_to @add_project
	else
		render 'new'
	end
 end
 
 def update
  @add_project = AddProject.find(params[:id])

  if @add_project.update(add_project_param)
   redirect_to @add_project
  else
   render 'edit'
  end
 end

 def destroy
  @add_project = AddProject.find(params[:id])
  @add_project.destroy

  redirect_to add_project_index_path 
 end

private
 def add_project_param
  params.require(:add_project).permit(:title, :admin, :status, :group_name, :deadline, :link, :info)
 end
 

end
