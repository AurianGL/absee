class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @version = Version.find(params[:version_id])
    @project = @version.project
    @comment.version = @version
    @comment.user = current_user
    authorize @comment
    if @comment.save
      @comment.reload
      dimensions = FastImage.size(@comment.image.url)
      binding.pry
      @comment.width = dimensions[0]
      @comment.height = dimensions[1]
      respond_to do |format|
        format.html do
          flash[:notice] = 'your comment has been added'
          redirect_to project_path(@project)
        end
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html do
          flash[:notice] = 'error'
          redirect_to project_path(@project)
        end
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
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
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html do
          flash[:notice] = "couldn't update comment"
          redirect_to project_path(@project)
        end
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:description, :image, :x, :y, :size, :display, :z, :canvas)
  end
end
