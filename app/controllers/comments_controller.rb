class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /articles/:article_id/comments/
  def index
    @comments = @article.comments;
  end


  # GET /articles/:article_id/comments/:id
  def show
  end

  # POST /articles/:article_id/comments/
  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
    	@article = Article.find(params[:article_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @article.comments.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
