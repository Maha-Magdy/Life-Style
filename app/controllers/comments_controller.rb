class CommentsController < ApplicationController
    def create
      @comment = Comment.new(comment_params)
      @comment.article_id = params[:article_id]
      @comment.user = current_user
  
      if @comment.save
        redirect_to article_path(params[:article_id]), notice: 'Comment was successfully created.'
      else
        redirect_to article_path(params[:article_id]), alert: @comment.errors.full_messages.join('. ').to_s
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
end