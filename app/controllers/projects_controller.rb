class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, only: [:show]

    def index
        @projects = current_user.projects
    end

    def show
    end

    def new
        @project = current_user.projects.new
    end

    def create
        @project = current_user.projects.new(project_params)
    
        respond_to do |format|
          if @project.save
            format.html { redirect_to @project, notice: 'Project was successfully created.' }
            format.json { render :show, status: :created, location: @project }
          else
            format.html { render :new }
            format.json { render json: @project.errors, status: :unprocessable_entity }
          end
        end
      end

    private

        def set_project
            @project = current_user.projects.find_by_id(params[:id])

            redirect_to projects_path() if @project.blank?
        end

        def project_params
            params.require(:project).permit(:name, :address, :filenumber)
          end
end