class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    if @is_admin
      @article = Article.new
    else
      redirect_to root_url
    end
  end

  # GET /articles/1/edit
  def edit
    if @is_admin
    else
      redirect_to root_url
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    if @is_admin
      @article = Article.new(article_params)
  
      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: '' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @is_admin
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to :back, notice: '' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if @is_admin
      @article.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: '' }
        format.json { head :no_content }
      end
    else
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :subtitle, :body)
    end
end
