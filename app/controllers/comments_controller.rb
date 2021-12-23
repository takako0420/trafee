class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    set_comment
  end

  def create
    @document = current_user.documents.last
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
      flash[:warning] = 'コメントを保存しました。'
    else
      set_comment
      render :new
    end
  end

  private

  def set_comment
    document = User.includes(:documents => :comment).find_by_id(current_user.id)
    gon.documents = @documents = document.documents
    comments = @documents.map{|document|document.comment}.flatten
    gon.comments = comments.compact
  end

  def comment_params
    params.require(:comment).permit(:feedback, :target).merge(document_id: @document.id)
  end
end