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

  # GET /articles/:article_id/comments/
  def new
    @article = @article.comments
  end

  # POST /articles/:article_id/comments/
  def create
    @comment = @article.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: '' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { redirect_to article_path(@article) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
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
