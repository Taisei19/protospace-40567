class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # 保存成功時、プロトタイプ詳細ページへリダイレクトします
      redirect_to prototype_path(@comment.prototype_id)
    else
      # 保存失敗時、プロトタイプ詳細ページへリダイレクトします
      redirect_to prototype_path(@comment.prototype_id), alert: "コメントの保存に失敗しました。"
    end
  end
  
  def show
    @prototype = Prototype.find(params[:id])
    @comment = @Comment.new 
    @comments = @prototype.comments 
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
  
  
end
