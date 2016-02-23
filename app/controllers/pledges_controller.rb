class PledgesController < ApplicationController
  before_action :load_project

  def create
    @pledge = @project.pledges.build(pledge_params)

    respond_to do |format|
      if @pledge.save
        format.html { redirect_to project_path(@project.id), notice: 'Review added.' }
        format.js {}
      else
        format.html { render 'projects/show', alert: 'There was an error.' }
        format.js {}
      end
    end
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount, :user_id, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

end
