class CommentsController < ApplicationController
  before_action :load_project

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_path(@project.id), notice: 'Comment added.' }
        format.js {}
      else
        format.html { render 'projects/show', alert: 'There was an error.' }
        format.js {}
      end
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:comment, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
