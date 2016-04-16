class AddProjectController < ApplicationController
 def index
  @add_proj = AddProject.all
 end
 def new
  @add_project = AddProject.new
 end

 def edit
  confirm "Are you sure?"
  @add_project = AddProject.find(params[:id])
 end
 
 def show
  @add_proj = AddProject.find(params[:id])
 end

 def create
  @add_project = AddProject.new(add_project_param)
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
  params.require(:add_project).permit(:title, :admin, :group, :group_name, :deadline, :link, :info)
 end
 

end
