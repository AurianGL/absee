class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @version = Version.find(params[:version_id])
    @project = @version.project
    @comment.version = @version
    @comment.user = current_user

    authorize @comment
    if @comment.save
      redirect_to project_path(@project)
    else
      redirect_to project_path(@project)
    end
  end

  def comment_params
    params.require(:comment).permit(:description, :image)
  end
end
