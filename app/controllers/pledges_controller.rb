class PledgesController < ApplicationController
  before_action :load_project

  def create

    @pledge = @project.pledges.build(pledge_params)
    @pledge.user = current_user
    # To let project know that pledge is done be current user. Before that the pleadge
    # were not assigned to a particular user.

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
    params.require(:pledge).permit(:amount, :user_id, :project_id, :reward_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

  def get_reward
    @reward = Reward.find(params[:reward_id])
  end

end
