class CommentsController < ApplicationController
  
  def index
    @comment = Comment.all
  end
  
  def show
    @topic = Topic.all.find(params[:id])
    @comment = Comment.new
  end
  
  def create

    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメントを追加しました'
    else
      redirect_to topics_path, danger: 'コメントの追加に失敗しました'
    end
    
    
  end
  
  private
  def comment_params
    params.require(:comment).permit(:topic_id, :message)
  end
  
end
