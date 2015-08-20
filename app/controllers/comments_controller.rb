class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create!(comment_params)
    redirect_to user_article_path(@article.user, @article), :notice => "Comment created!"
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to user_article_path(@article.user, @article), notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name, :content)
  end

end
