class ProjectsController < ApplicationController
  def index
    @projects = if params[:search]
      Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      @projects = Project.all
    end

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "You have made a project!"
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to projects_path(@project)
    else
      render :edit
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])

    @pledge = @project.pledges.build
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :goal, :end_date,
                                    rewards_attributes: [:name, :description, :amount, :_destroy])
  end
end
