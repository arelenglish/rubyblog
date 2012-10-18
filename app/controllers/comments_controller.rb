class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment])
    # @comment.textcaptcha
    redirect_to article_path(@article)
  end
    
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
end
