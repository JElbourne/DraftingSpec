class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, only: [:show]

    def index
        @projects = current_user.projects
    end

    def show
    end

    def new

    end

    private

        def set_project
            @project = current_user.projects.find_by_id(params[:id])

            redirect_to projects_path() if @project.blank?
        end
end