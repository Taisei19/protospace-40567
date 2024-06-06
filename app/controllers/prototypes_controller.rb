class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def show
    @prototype = Prototype.find(params[:id]) 
    @comment = Comment.new
    @comments = @prototype.comments
  end


  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user == current_user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
  
    if @prototype.update(prototype_params)
      # 更新が成功した場合、詳細ページにリダイレクトする
      redirect_to prototype_path(@prototype)
    else
      # 更新が失敗した場合、編集画面を再描画する
      render :edit
    end
  end
  
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end


  def create
  @prototype = Prototype.new(prototype_params)

  if @prototype.save
    redirect_to root_path
  else
    render 'new'
  end
end 

private


  
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
  
