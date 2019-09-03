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
      respond_to do |format|
        format.html { redirect_to project_path(@project) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      flash[:notice] = 'error'
      redirect_to project_path(@project)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @project = @comment.version.project
    authorize @comment

    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to project_path(@project) }
        format.js # <-- will render `app/views/comment/update.js.erb`
      end
    else
      flash[:notice] = "couldn't update comment"
      respond_to do |format|
        format.html { redirect_to project_path(@project) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:description, :image, :x, :y)
  end
end

# @color_swatch = ColorSwatch.find(params[:id])
#     @version = Version.find(params[:version_id])
#     @project = @version.project
#     authorize @color_swatch


