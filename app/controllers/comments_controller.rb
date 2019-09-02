class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @version = Version.find(params[:version_id])
    @project = @version.project
    @comment.version = @version
    @comment.user = current_user
    authorize @comment
    if @comment.save
      flash[:notice] = 'your comment has been added'
      redirect_to project_path(@project)
    else
      flash[:notice] = 'error'
      redirect_to project_path(@project)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def comment_params
    params.require(:comment).permit(:description, :image)
  end
end
