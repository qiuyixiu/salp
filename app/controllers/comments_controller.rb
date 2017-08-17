class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    @exchange = Exchange.find(params[:exchange_id])
    @comment = @exchange.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to exchange_path(@exchange), notice: "已评论"
    else
      redirect_to exchange_path(@exchange), notice: "内容不能为空"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
