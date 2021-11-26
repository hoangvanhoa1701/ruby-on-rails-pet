class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :check_current_user, only: %i[ update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    check_current_user
  end

  # POST /articles or /articles.json
  def create
    # 1.
    # @article = Article.new(article_params)
    # @article[:user_id] = Current.user.id

    # 2.
    @article = Current.user.articles.new(article_params)

    @article.image = params[:article][:image]

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      @article.image = params[:article][:image]
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def redirect_url_func(id)
    redirect_to article_path(id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

    def check_current_user
      if Current.user.nil?
        # session[:back_url] = request.url
        redirect_to sign_in_path, alert: "You must be signed in to do that!"
      elsif !Current.user.admin? && @article.user_id != Current.user.id
        redirect_to article_path, alert: "You don't have permission!"
      end
    end
end
